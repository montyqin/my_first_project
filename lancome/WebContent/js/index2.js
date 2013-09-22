/*
 * ! jQuery Cycle Plugin (with Transition Definitions) Examples and
 * documentation at: http://jquery.malsup.com/cycle/ Copyright (c) 2007-2010 M.
 * Alsup Version: 2.9999 (13-NOV-2011) Dual licensed under the MIT and GPL
 * licenses. http://jquery.malsup.com/license.html Requires: jQuery v1.3.2 or
 * later
 */
(function(I, H) {
	var J = "2.9999";
	if (I.support == H) {
		I.support = {
			opacity : !(I.browser.msie)
		}
	}
	function E(a) {
		I.fn.cycle.debug && F(a)
	}
	function F() {
		window.console
				&& console.log
				&& console.log("[cycle] "
						+ Array.prototype.join.call(arguments, " "))
	}
	I.expr[":"].paused = function(a) {
		return a.cyclePause
	};
	I.fn.cycle = function(b, c) {
		var a = {
			s : this.selector,
			c : this.context
		};
		if (this.length === 0 && b != "stop") {
			if (!I.isReady && a.s) {
				F("DOM not ready, queuing slideshow");
				I(function() {
					I(a.s, a.c).cycle(b, c)
				});
				return this
			}
			F("terminating; zero elements found by selector"
					+ (I.isReady ? "" : " (DOM not ready)"));
			return this
		}
		return this.each(function() {
			var g = z(this, b, c);
			if (g === false) {
				return
			}
			g.updateActivePagerLink = g.updateActivePagerLink
					|| I.fn.cycle.updateActivePagerLink;
			if (this.cycleTimeout) {
				clearTimeout(this.cycleTimeout)
			}
			this.cycleTimeout = this.cyclePause = 0;
			var e = I(this);
			var i = g.slideExpr ? I(g.slideExpr, this) : e.children();
			var d = i.get();
			var f = u(e, i, d, g, a);
			if (f === false) {
				return
			}
			if (d.length < 2) {
				F("terminating; too few slides: " + d.length);
				return
			}
			var h = f.continuous ? 10 : y(d[f.currSlide], d[f.nextSlide], f,
					!f.backwards);
			if (h) {
				h += (f.delay || 0);
				if (h < 10) {
					h = 10
				}
				E("first timeout: " + h);
				this.cycleTimeout = setTimeout(function() {
					x(d, f, 0, !g.backwards)
				}, h)
			}
		})
	};
	function A(e, b, c) {
		var a = I(e).data("cycle.opts");
		var d = !!e.cyclePause;
		if (d && a.paused) {
			a.paused(e, a, b, c)
		} else {
			if (!d && a.resumed) {
				a.resumed(e, a, b, c)
			}
		}
	}
	function z(e, b, d) {
		if (e.cycleStop == H) {
			e.cycleStop = 0
		}
		if (b === H || b === null) {
			b = {}
		}
		if (b.constructor == String) {
			switch (b) {
			case "destroy":
			case "stop":
				var f = I(e).data("cycle.opts");
				if (!f) {
					return false
				}
				e.cycleStop++;
				if (e.cycleTimeout) {
					clearTimeout(e.cycleTimeout)
				}
				e.cycleTimeout = 0;
				f.elements && I(f.elements).stop();
				I(e).removeData("cycle.opts");
				if (b == "destroy") {
					t(f)
				}
				return false;
			case "toggle":
				e.cyclePause = (e.cyclePause === 1) ? 0 : 1;
				a(e.cyclePause, d, e);
				A(e);
				return false;
			case "pause":
				e.cyclePause = 1;
				A(e);
				return false;
			case "resume":
				e.cyclePause = 0;
				a(false, d, e);
				A(e);
				return false;
			case "prev":
			case "next":
				var f = I(e).data("cycle.opts");
				if (!f) {
					F('options not found, "prev/next" ignored');
					return false
				}
				I.fn.cycle[b](f);
				return false;
			default:
				b = {
					fx : b
				}
			}
			return b
		} else {
			if (b.constructor == Number) {
				var c = b;
				b = I(e).data("cycle.opts");
				if (!b) {
					F("options not found, can not advance slide");
					return false
				}
				if (c < 0 || c >= b.elements.length) {
					F("invalid slide index: " + c);
					return false
				}
				b.nextSlide = c;
				if (e.cycleTimeout) {
					clearTimeout(e.cycleTimeout);
					e.cycleTimeout = 0
				}
				if (typeof d == "string") {
					b.oneTimeFx = d
				}
				x(b.elements, b, 1, c >= b.currSlide);
				return false
			}
		}
		return b;
		function a(g, j, i) {
			if (!g && j === true) {
				var h = I(i).data("cycle.opts");
				if (!h) {
					F("options not found, can not resume");
					return false
				}
				if (i.cycleTimeout) {
					clearTimeout(i.cycleTimeout);
					i.cycleTimeout = 0
				}
				x(h.elements, h, 1, !h.backwards)
			}
		}
	}
	function G(c, b) {
		if (!I.support.opacity && b.cleartype && c.style.filter) {
			try {
				c.style.removeAttribute("filter")
			} catch (a) {
			}
		}
	}
	function t(a) {
		if (a.next) {
			I(a.next).unbind(a.prevNextEvent)
		}
		if (a.prev) {
			I(a.prev).unbind(a.prevNextEvent)
		}
		if (a.pager || a.pagerAnchorBuilder) {
			I.each(a.pagerAnchors || [], function() {
				this.unbind().remove()
			})
		}
		a.pagerAnchors = null;
		if (a.destroy) {
			a.destroy(a)
		}
	}
	function u(W, b, Z, j, i) {
		var V;
		var n = I.extend({}, I.fn.cycle.defaults, j || {}, I.metadata ? W
				.metadata() : I.meta ? W.data() : {});
		var q = I.isFunction(W.data) ? W.data(n.metaAttr) : null;
		if (q) {
			n = I.extend(n, q)
		}
		if (n.autostop) {
			n.countdown = n.autostopCount || Z.length
		}
		var r = W[0];
		W.data("cycle.opts", n);
		n.$cont = W;
		n.stopCount = r.cycleStop;
		n.elements = Z;
		n.before = n.before ? [ n.before ] : [];
		n.after = n.after ? [ n.after ] : [];
		if (!I.support.opacity && n.cleartype) {
			n.after.push(function() {
				G(this, n)
			})
		}
		if (n.continuous) {
			n.after.push(function() {
				x(Z, n, 0, !n.backwards)
			})
		}
		C(n);
		if (!I.support.opacity && n.cleartype && !n.cleartypeNoBg) {
			K(b)
		}
		if (W.css("position") == "static") {
			W.css("position", "relative")
		}
		if (n.width) {
			W.width(n.width)
		}
		if (n.height && n.height != "auto") {
			W.height(n.height)
		}
		if (n.startingSlide != H) {
			n.startingSlide = parseInt(n.startingSlide, 10);
			if (n.startingSlide >= Z.length || n.startSlide < 0) {
				n.startingSlide = 0
			} else {
				V = true
			}
		} else {
			if (n.backwards) {
				n.startingSlide = Z.length - 1
			} else {
				n.startingSlide = 0
			}
		}
		if (n.random) {
			n.randomMap = [];
			for ( var d = 0; d < Z.length; d++) {
				n.randomMap.push(d)
			}
			n.randomMap.sort(function(M, L) {
				return Math.random() - 0.5
			});
			if (V) {
				for ( var f = 0; f < Z.length; f++) {
					if (n.startingSlide == n.randomMap[f]) {
						n.randomIndex = f
					}
				}
			} else {
				n.randomIndex = 1;
				n.startingSlide = n.randomMap[1]
			}
		} else {
			if (n.startingSlide >= Z.length) {
				n.startingSlide = 0
			}
		}
		n.currSlide = n.startingSlide || 0;
		var X = n.startingSlide;
		b.css({
			position : "absolute",
			top : 0,
			left : 0
		}).hide().each(function(L) {
			var M;
			if (n.backwards) {
				M = X ? L <= X ? Z.length + (L - X) : X - L : Z.length - L
			} else {
				M = X ? L >= X ? Z.length - (L - X) : X - L : Z.length - L
			}
			I(this).css("z-index", M)
		});
		I(Z[X]).css("opacity", 1).show();
		G(Z[X], n);
		if (n.fit) {
			if (!n.aspect) {
				if (n.width) {
					b.width(n.width)
				}
				if (n.height && n.height != "auto") {
					b.height(n.height)
				}
			} else {
				b.each(function() {
					var M = I(this);
					var L = (n.aspect === true) ? M.width() / M.height()
							: n.aspect;
					if (n.width && M.width() != n.width) {
						M.width(n.width);
						M.height(n.width / L)
					}
					if (n.height && M.height() < n.height) {
						M.height(n.height);
						M.width(n.height * L)
					}
				})
			}
		}
		if (n.center && ((!n.fit) || n.aspect)) {
			b.each(function() {
				var L = I(this);
				L.css({
					"margin-left" : n.width ? ((n.width - L.width()) / 2)
							+ "px" : 0,
					"margin-top" : n.height ? ((n.height - L.height()) / 2)
							+ "px" : 0
				})
			})
		}
		if (n.center && !n.fit && !n.slideResize) {
			b.each(function() {
				var L = I(this);
				L.css({
					"margin-left" : n.width ? ((n.width - L.width()) / 2)
							+ "px" : 0,
					"margin-top" : n.height ? ((n.height - L.height()) / 2)
							+ "px" : 0
				})
			})
		}
		var l = n.containerResize && !W.innerHeight();
		if (l) {
			var Y = 0, o = 0;
			for ( var g = 0; g < Z.length; g++) {
				var T = I(Z[g]), a = T[0], s = T.outerWidth(), c = T
						.outerHeight();
				if (!s) {
					s = a.offsetWidth || a.width || T.attr("width")
				}
				if (!c) {
					c = a.offsetHeight || a.height || T.attr("height")
				}
				Y = s > Y ? s : Y;
				o = c > o ? c : o
			}
			if (Y > 0 && o > 0) {
				W.css({
					width : Y + "px",
					height : o + "px"
				})
			}
		}
		var k = false;
		if (n.pause) {
			W.hover(function() {
				k = true;
				this.cyclePause++;
				A(r, true)
			}, function() {
				k && this.cyclePause--;
				A(r, true)
			})
		}
		if (w(n) === false) {
			return false
		}
		var m = false;
		j.requeueAttempts = j.requeueAttempts || 0;
		b
				.each(function() {
					var N = I(this);
					this.cycleH = (n.fit && n.height) ? n.height : (N.height()
							|| this.offsetHeight || this.height
							|| N.attr("height") || 0);
					this.cycleW = (n.fit && n.width) ? n.width : (N.width()
							|| this.offsetWidth || this.width
							|| N.attr("width") || 0);
					if (N.is("img")) {
						var P = (I.browser.msie && this.cycleW == 28
								&& this.cycleH == 30 && !this.complete);
						var L = (I.browser.mozilla && this.cycleW == 34
								&& this.cycleH == 19 && !this.complete);
						var O = (I.browser.opera
								&& ((this.cycleW == 42 && this.cycleH == 19) || (this.cycleW == 37 && this.cycleH == 17)) && !this.complete);
						var M = (this.cycleH == 0 && this.cycleW == 0 && !this.complete);
						if (P || L || O || M) {
							if (i.s && n.requeueOnImageNotLoaded
									&& ++j.requeueAttempts < 100) {
								F(
										j.requeueAttempts,
										" - img slide not loaded, requeuing slideshow: ",
										this.src, this.cycleW, this.cycleH);
								setTimeout(function() {
									I(i.s, i.c).cycle(j)
								}, n.requeueTimeout);
								m = true;
								return false
							} else {
								F("could not determine size of image: "
										+ this.src, this.cycleW, this.cycleH)
							}
						}
					}
					return true
				});
		if (m) {
			return false
		}
		n.cssBefore = n.cssBefore || {};
		n.cssAfter = n.cssAfter || {};
		n.cssFirst = n.cssFirst || {};
		n.animIn = n.animIn || {};
		n.animOut = n.animOut || {};
		b.not(":eq(" + X + ")").css(n.cssBefore);
		I(b[X]).css(n.cssFirst);
		if (n.timeout) {
			n.timeout = parseInt(n.timeout, 10);
			if (n.speed.constructor == String) {
				n.speed = I.fx.speeds[n.speed] || parseInt(n.speed, 10)
			}
			if (!n.sync) {
				n.speed = n.speed / 2
			}
			var h = n.fx == "none" ? 0 : n.fx == "shuffle" ? 500 : 250;
			while ((n.timeout - n.speed) < h) {
				n.timeout += n.speed
			}
		}
		if (n.easing) {
			n.easeIn = n.easeOut = n.easing
		}
		if (!n.speedIn) {
			n.speedIn = n.speed
		}
		if (!n.speedOut) {
			n.speedOut = n.speed
		}
		n.slideCount = Z.length;
		n.currSlide = n.lastSlide = X;
		if (n.random) {
			if (++n.randomIndex == Z.length) {
				n.randomIndex = 0
			}
			n.nextSlide = n.randomMap[n.randomIndex]
		} else {
			if (n.backwards) {
				n.nextSlide = n.startingSlide == 0 ? (Z.length - 1)
						: n.startingSlide - 1
			} else {
				n.nextSlide = n.startingSlide >= (Z.length - 1) ? 0
						: n.startingSlide + 1
			}
		}
		if (!n.multiFx) {
			var e = I.fn.cycle.transitions[n.fx];
			if (I.isFunction(e)) {
				e(W, b, n)
			} else {
				if (n.fx != "custom" && !n.multiFx) {
					F("unknown transition: " + n.fx, "; slideshow terminating");
					return false
				}
			}
		}
		var U = b[X];
		if (!n.skipInitializationCallbacks) {
			if (n.before.length) {
				n.before[0].apply(U, [ U, U, n, true ])
			}
			if (n.after.length) {
				n.after[0].apply(U, [ U, U, n, true ])
			}
		}
		if (n.next) {
			I(n.next).bind(n.prevNextEvent, function() {
				return D(n, 1)
			})
		}
		if (n.prev) {
			I(n.prev).bind(n.prevNextEvent, function() {
				return D(n, 0)
			})
		}
		if (n.pager || n.pagerAnchorBuilder) {
			v(Z, n)
		}
		B(n, Z);
		return n
	}
	function C(a) {
		a.original = {
			before : [],
			after : []
		};
		a.original.cssBefore = I.extend({}, a.cssBefore);
		a.original.cssAfter = I.extend({}, a.cssAfter);
		a.original.animIn = I.extend({}, a.animIn);
		a.original.animOut = I.extend({}, a.animOut);
		I.each(a.before, function() {
			a.original.before.push(this)
		});
		I.each(a.after, function() {
			a.original.after.push(this)
		})
	}
	function w(f) {
		var a, c, d = I.fn.cycle.transitions;
		if (f.fx.indexOf(",") > 0) {
			f.multiFx = true;
			f.fxs = f.fx.replace(/\s*/g, "").split(",");
			for (a = 0; a < f.fxs.length; a++) {
				var g = f.fxs[a];
				c = d[g];
				if (!c || !d.hasOwnProperty(g) || !I.isFunction(c)) {
					F("discarding unknown transition: ", g);
					f.fxs.splice(a, 1);
					a--
				}
			}
			if (!f.fxs.length) {
				F("No valid transitions named; slideshow terminating.");
				return false
			}
		} else {
			if (f.fx == "all") {
				f.multiFx = true;
				f.fxs = [];
				for (p in d) {
					c = d[p];
					if (d.hasOwnProperty(p) && I.isFunction(c)) {
						f.fxs.push(p)
					}
				}
			}
		}
		if (f.multiFx && f.randomizeEffects) {
			var b = Math.floor(Math.random() * 20) + 30;
			for (a = 0; a < b; a++) {
				var e = Math.floor(Math.random() * f.fxs.length);
				f.fxs.push(f.fxs.splice(e, 1)[0])
			}
			E("randomized fx sequence: ", f.fxs)
		}
		return true
	}
	function B(a, b) {
		a.addSlide = function(d, c) {
			var e = I(d), f = e[0];
			if (!a.autostopCount) {
				a.countdown++
			}
			b[c ? "unshift" : "push"](f);
			if (a.els) {
				a.els[c ? "unshift" : "push"](f)
			}
			a.slideCount = b.length;
			if (a.random) {
				a.randomMap.push(a.slideCount - 1);
				a.randomMap.sort(function(g, h) {
					return Math.random() - 0.5
				})
			}
			e.css("position", "absolute");
			e[c ? "prependTo" : "appendTo"](a.$cont);
			if (c) {
				a.currSlide++;
				a.nextSlide++
			}
			if (!I.support.opacity && a.cleartype && !a.cleartypeNoBg) {
				K(e)
			}
			if (a.fit && a.width) {
				e.width(a.width)
			}
			if (a.fit && a.height && a.height != "auto") {
				e.height(a.height)
			}
			f.cycleH = (a.fit && a.height) ? a.height : e.height();
			f.cycleW = (a.fit && a.width) ? a.width : e.width();
			e.css(a.cssBefore);
			if (a.pager || a.pagerAnchorBuilder) {
				I.fn.cycle.createPagerAnchor(b.length - 1, f, I(a.pager), b, a)
			}
			if (I.isFunction(a.onAddSlide)) {
				a.onAddSlide(e)
			} else {
				e.hide()
			}
		}
	}
	I.fn.cycle.resetState = function(b, c) {
		c = c || b.fx;
		b.before = [];
		b.after = [];
		b.cssBefore = I.extend({}, b.original.cssBefore);
		b.cssAfter = I.extend({}, b.original.cssAfter);
		b.animIn = I.extend({}, b.original.animIn);
		b.animOut = I.extend({}, b.original.animOut);
		b.fxFn = null;
		I.each(b.original.before, function() {
			b.before.push(this)
		});
		I.each(b.original.after, function() {
			b.after.push(this)
		});
		var a = I.fn.cycle.transitions[c];
		if (I.isFunction(a)) {
			a(b.$cont, I(b.elements), b)
		}
	};
	function x(e, k, f, c) {
		if (f && k.busy && k.manualTrump) {
			E("manualTrump in go(), stopping active transition");
			I(e).stop(true, true);
			k.busy = 0
		}
		if (k.busy) {
			E("transition active, ignoring new tx request");
			return
		}
		var h = k.$cont[0], l = e[k.currSlide], b = e[k.nextSlide];
		if (h.cycleStop != k.stopCount || h.cycleTimeout === 0 && !f) {
			return
		}
		if (!f
				&& !h.cyclePause
				&& !k.bounce
				&& ((k.autostop && (--k.countdown <= 0)) || (k.nowrap
						&& !k.random && k.nextSlide < k.currSlide))) {
			if (k.end) {
				k.end(k)
			}
			return
		}
		var d = false;
		if ((f || !h.cyclePause) && (k.nextSlide != k.currSlide)) {
			d = true;
			var g = k.fx;
			l.cycleH = l.cycleH || I(l).height();
			l.cycleW = l.cycleW || I(l).width();
			b.cycleH = b.cycleH || I(b).height();
			b.cycleW = b.cycleW || I(b).width();
			if (k.multiFx) {
				if (c && (k.lastFx == H || ++k.lastFx >= k.fxs.length)) {
					k.lastFx = 0
				} else {
					if (!c && (k.lastFx == H || --k.lastFx < 0)) {
						k.lastFx = k.fxs.length - 1
					}
				}
				g = k.fxs[k.lastFx]
			}
			if (k.oneTimeFx) {
				g = k.oneTimeFx;
				k.oneTimeFx = null
			}
			I.fn.cycle.resetState(k, g);
			if (k.before.length) {
				I.each(k.before, function(n, m) {
					if (h.cycleStop != k.stopCount) {
						return
					}
					m.apply(b, [ l, b, k, c ])
				})
			}
			var j = function() {
				k.busy = 0;
				I.each(k.after, function(n, m) {
					if (h.cycleStop != k.stopCount) {
						return
					}
					m.apply(b, [ l, b, k, c ])
				});
				if (!h.cycleStop) {
					a()
				}
			};
			E("tx firing(" + g + "); currSlide: " + k.currSlide
					+ "; nextSlide: " + k.nextSlide);
			k.busy = 1;
			if (k.fxFn) {
				k.fxFn(l, b, k, j, c, f && k.fastOnEvent)
			} else {
				if (I.isFunction(I.fn.cycle[k.fx])) {
					I.fn.cycle[k.fx](l, b, k, j, c, f && k.fastOnEvent)
				} else {
					I.fn.cycle.custom(l, b, k, j, c, f && k.fastOnEvent)
				}
			}
		} else {
			a()
		}
		if (d || k.nextSlide == k.currSlide) {
			k.lastSlide = k.currSlide;
			if (k.random) {
				k.currSlide = k.nextSlide;
				if (++k.randomIndex == e.length) {
					k.randomIndex = 0;
					k.randomMap.sort(function(m, n) {
						return Math.random() - 0.5
					})
				}
				k.nextSlide = k.randomMap[k.randomIndex];
				if (k.nextSlide == k.currSlide) {
					k.nextSlide = (k.currSlide == k.slideCount - 1) ? 0
							: k.currSlide + 1
				}
			} else {
				if (k.backwards) {
					var i = (k.nextSlide - 1) < 0;
					if (i && k.bounce) {
						k.backwards = !k.backwards;
						k.nextSlide = 1;
						k.currSlide = 0
					} else {
						k.nextSlide = i ? (e.length - 1) : k.nextSlide - 1;
						k.currSlide = i ? 0 : k.nextSlide + 1
					}
				} else {
					var i = (k.nextSlide + 1) == e.length;
					if (i && k.bounce) {
						k.backwards = !k.backwards;
						k.nextSlide = e.length - 2;
						k.currSlide = e.length - 1
					} else {
						k.nextSlide = i ? 0 : k.nextSlide + 1;
						k.currSlide = i ? e.length - 1 : k.nextSlide - 1
					}
				}
			}
		}
		if (d && k.pager) {
			k.updateActivePagerLink(k.pager, k.currSlide, k.activePagerClass)
		}
		function a() {
			var n = 0, m = k.timeout;
			if (k.timeout && !k.continuous) {
				n = y(e[k.currSlide], e[k.nextSlide], k, c);
				if (k.fx == "shuffle") {
					n -= k.speedOut
				}
			} else {
				if (k.continuous && h.cyclePause) {
					n = 10
				}
			}
			if (n > 0) {
				h.cycleTimeout = setTimeout(function() {
					x(e, k, 0, !k.backwards)
				}, n)
			}
		}
	}
	I.fn.cycle.updateActivePagerLink = function(c, a, b) {
		I(c).each(function() {
			I(this).children().removeClass(b).eq(a).addClass(b)
		})
	};
	function y(e, b, a, c) {
		if (a.timeoutFn) {
			var d = a.timeoutFn.call(e, e, b, a, c);
			while (a.fx != "none" && (d - a.speed) < 250) {
				d += a.speed
			}
			E("calculated timeout: " + d + "; speed: " + a.speed);
			if (d !== false) {
				return d
			}
		}
		return a.timeout
	}
	I.fn.cycle.next = function(a) {
		D(a, 1)
	};
	I.fn.cycle.prev = function(a) {
		D(a, 0)
	};
	function D(b, c) {
		var f = c ? 1 : -1;
		var d = b.elements;
		var g = b.$cont[0], a = g.cycleTimeout;
		if (a) {
			clearTimeout(a);
			g.cycleTimeout = 0
		}
		if (b.random && f < 0) {
			b.randomIndex--;
			if (--b.randomIndex == -2) {
				b.randomIndex = d.length - 2
			} else {
				if (b.randomIndex == -1) {
					b.randomIndex = d.length - 1
				}
			}
			b.nextSlide = b.randomMap[b.randomIndex]
		} else {
			if (b.random) {
				b.nextSlide = b.randomMap[b.randomIndex]
			} else {
				b.nextSlide = b.currSlide + f;
				if (b.nextSlide < 0) {
					if (b.nowrap) {
						return false
					}
					b.nextSlide = d.length - 1
				} else {
					if (b.nextSlide >= d.length) {
						if (b.nowrap) {
							return false
						}
						b.nextSlide = 0
					}
				}
			}
		}
		var e = b.onPrevNextEvent || b.prevNextClick;
		if (I.isFunction(e)) {
			e(f > 0, b.nextSlide, d[b.nextSlide])
		}
		x(d, b, 1, c);
		return false
	}
	function v(b, a) {
		var c = I(a.pager);
		I.each(b, function(e, d) {
			I.fn.cycle.createPagerAnchor(e, d, c, b, a)
		});
		a.updateActivePagerLink(a.pager, a.startingSlide, a.activePagerClass)
	}
	I.fn.cycle.createPagerAnchor = function(f, i, d, g, j) {
		var c;
		if (I.isFunction(j.pagerAnchorBuilder)) {
			c = j.pagerAnchorBuilder(f, i);
			E("pagerAnchorBuilder(" + f + ", el) returned: " + c)
		} else {
			c = '<a href="#">' + (f + 1) + "</a>"
		}
		if (!c) {
			return
		}
		var h = I(c);
		if (h.parents("body").length === 0) {
			var e = [];
			if (d.length > 1) {
				d.each(function() {
					var l = h.clone(true);
					I(this).append(l);
					e.push(l[0])
				});
				h = I(e)
			} else {
				h.appendTo(d)
			}
		}
		j.pagerAnchors = j.pagerAnchors || [];
		j.pagerAnchors.push(h);
		var b = function(l) {
			l.preventDefault();
			j.nextSlide = f;
			var m = j.$cont[0], n = m.cycleTimeout;
			if (n) {
				clearTimeout(n);
				m.cycleTimeout = 0
			}
			var o = j.onPagerEvent || j.pagerClick;
			if (I.isFunction(o)) {
				o(j.nextSlide, g[j.nextSlide])
			}
			x(g, j, 1, j.currSlide < f)
		};
		if (/mouseenter|mouseover/i.test(j.pagerEvent)) {
			h.hover(b, function() {
			})
		} else {
			h.bind(j.pagerEvent, b)
		}
		if (!/^click/.test(j.pagerEvent) && !j.allowPagerClickBubble) {
			h.bind("click.cycle", function() {
				return false
			})
		}
		var a = j.$cont[0];
		var k = false;
		if (j.pauseOnPagerHover) {
			h.hover(function() {
				k = true;
				a.cyclePause++;
				A(a, true, true)
			}, function() {
				k && a.cyclePause--;
				A(a, true, true)
			})
		}
	};
	I.fn.cycle.hopsFromLast = function(b, c) {
		var d, e = b.lastSlide, a = b.currSlide;
		if (c) {
			d = a > e ? a - e : b.slideCount - e
		} else {
			d = a < e ? e - a : e + b.slideCount - a
		}
		return d
	};
	function K(a) {
		E("applying clearType background-color hack");
		function b(d) {
			d = parseInt(d, 10).toString(16);
			return d.length < 2 ? "0" + d : d
		}
		function c(f) {
			for (; f && f.nodeName.toLowerCase() != "html"; f = f.parentNode) {
				var e = I.css(f, "background-color");
				if (e && e.indexOf("rgb") >= 0) {
					var d = e.match(/\d+/g);
					return "#" + b(d[0]) + b(d[1]) + b(d[2])
				}
				if (e && e != "transparent") {
					return e
				}
			}
			return "#ffffff"
		}
		a.each(function() {
			I(this).css("background-color", c(this))
		})
	}
	I.fn.cycle.commonReset = function(e, a, f, c, b, d) {
		I(f.elements).not(e).hide();
		if (typeof f.cssBefore.opacity == "undefined") {
			f.cssBefore.opacity = 1
		}
		f.cssBefore.display = "block";
		if (f.slideResize && c !== false && a.cycleW > 0) {
			f.cssBefore.width = a.cycleW
		}
		if (f.slideResize && b !== false && a.cycleH > 0) {
			f.cssBefore.height = a.cycleH
		}
		f.cssAfter = f.cssAfter || {};
		f.cssAfter.display = "none";
		I(e).css("zIndex", f.slideCount + (d === true ? 1 : 0));
		I(a).css("zIndex", f.slideCount + (d === true ? 0 : 1))
	};
	I.fn.cycle.custom = function(k, e, l, h, f, j) {
		var m = I(k), d = I(e);
		var i = l.speedIn, a = l.speedOut, g = l.easeIn, b = l.easeOut;
		d.css(l.cssBefore);
		if (j) {
			if (typeof j == "number") {
				i = a = j
			} else {
				i = a = 1
			}
			g = b = null
		}
		var c = function() {
			d.animate(l.animIn, i, g, function() {
				h()
			})
		};
		m.animate(l.animOut, a, b, function() {
			m.css(l.cssAfter);
			if (!l.sync) {
				c()
			}
		});
		if (l.sync) {
			c()
		}
	};
	I.fn.cycle.transitions = {
		fade : function(b, a, c) {
			a.not(":eq(" + c.currSlide + ")").css("opacity", 0);
			c.before.push(function(f, e, d) {
				I.fn.cycle.commonReset(f, e, d);
				d.cssBefore.opacity = 0
			});
			c.animIn = {
				opacity : 1
			};
			c.animOut = {
				opacity : 0
			};
			c.cssBefore = {
				top : 0,
				left : 0
			}
		}
	};
	I.fn.cycle.ver = function() {
		return J
	};
	I.fn.cycle.defaults = {
		activePagerClass : "activeSlide",
		after : null,
		allowPagerClickBubble : false,
		animIn : null,
		animOut : null,
		aspect : false,
		autostop : 0,
		autostopCount : 0,
		backwards : false,
		before : null,
		center : null,
		cleartype : !I.support.opacity,
		cleartypeNoBg : false,
		containerResize : 1,
		continuous : 0,
		cssAfter : null,
		cssBefore : null,
		delay : 0,
		easeIn : null,
		easeOut : null,
		easing : null,
		end : null,
		fastOnEvent : 0,
		fit : 0,
		fx : "fade",
		fxFn : null,
		height : "auto",
		manualTrump : true,
		metaAttr : "cycle",
		next : null,
		nowrap : 0,
		onPagerEvent : null,
		onPrevNextEvent : null,
		pager : null,
		pagerAnchorBuilder : null,
		pagerEvent : "click.cycle",
		pause : 0,
		pauseOnPagerHover : 0,
		prev : null,
		prevNextEvent : "click.cycle",
		random : 0,
		randomizeEffects : 1,
		requeueOnImageNotLoaded : true,
		requeueTimeout : 250,
		rev : 0,
		shuffle : null,
		skipInitializationCallbacks : false,
		slideExpr : null,
		slideResize : 1,
		speed : 1000,
		speedIn : null,
		speedOut : null,
		startingSlide : H,
		sync : 1,
		timeout : 4000,
		timeoutFn : null,
		updateActivePagerLink : null,
		width : null
	}
})(jQuery);
/*
 * ! jQuery Cycle Plugin Transition Definitions This script is a plugin for the
 * jQuery Cycle Plugin Examples and documentation at:
 * http://malsup.com/jquery/cycle/ Copyright (c) 2007-2010 M. Alsup Version:
 * 2.73 Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 */
(function(b) {
	b.fn.cycle.transitions.none = function(f, e, a) {
		a.fxFn = function(d, j, i, c) {
			b(j).show();
			b(d).hide();
			c()
		}
	};
	b.fn.cycle.transitions.fadeout = function(f, e, a) {
		e.not(":eq(" + a.currSlide + ")").css({
			display : "block",
			opacity : 1
		});
		a.before.push(function(c, h, d, m, l, n) {
			b(c).css("zIndex", d.slideCount + (!n === true ? 1 : 0));
			b(h).css("zIndex", d.slideCount + (!n === true ? 0 : 1))
		});
		a.animIn.opacity = 1;
		a.animOut.opacity = 0;
		a.cssBefore.opacity = 1;
		a.cssBefore.display = "block";
		a.cssAfter.zIndex = 0
	};
	b.fn.cycle.transitions.scrollUp = function(g, f, h) {
		g.css("overflow", "hidden");
		h.before.push(b.fn.cycle.commonReset);
		var a = g.height();
		h.cssBefore.top = a;
		h.cssBefore.left = 0;
		h.cssFirst.top = 0;
		h.animIn.top = 0;
		h.animOut.top = -a
	};
	b.fn.cycle.transitions.scrollDown = function(g, f, h) {
		g.css("overflow", "hidden");
		h.before.push(b.fn.cycle.commonReset);
		var a = g.height();
		h.cssFirst.top = 0;
		h.cssBefore.top = -a;
		h.cssBefore.left = 0;
		h.animIn.top = 0;
		h.animOut.top = a
	};
	b.fn.cycle.transitions.scrollLeft = function(g, f, h) {
		g.css("overflow", "hidden");
		h.before.push(b.fn.cycle.commonReset);
		var a = g.width();
		h.cssFirst.left = 0;
		h.cssBefore.left = a;
		h.cssBefore.top = 0;
		h.animIn.left = 0;
		h.animOut.left = 0 - a
	};
	b.fn.cycle.transitions.scrollRight = function(g, f, h) {
		g.css("overflow", "hidden");
		h.before.push(b.fn.cycle.commonReset);
		var a = g.width();
		h.cssFirst.left = 0;
		h.cssBefore.left = -a;
		h.cssBefore.top = 0;
		h.animIn.left = 0;
		h.animOut.left = a
	};
	b.fn.cycle.transitions.scrollHorz = function(f, e, a) {
		f.css("overflow", "hidden").width();
		a.before.push(function(c, i, d, j) {
			if (d.rev) {
				j = !j
			}
			b.fn.cycle.commonReset(c, i, d);
			d.cssBefore.left = j ? (i.cycleW - 1) : (1 - i.cycleW);
			d.animOut.left = j ? -c.cycleW : c.cycleW
		});
		a.cssFirst.left = 0;
		a.cssBefore.top = 0;
		a.animIn.left = 0;
		a.animOut.top = 0
	};
	b.fn.cycle.transitions.scrollVert = function(f, e, a) {
		f.css("overflow", "hidden");
		a.before.push(function(c, i, d, j) {
			if (d.rev) {
				j = !j
			}
			b.fn.cycle.commonReset(c, i, d);
			d.cssBefore.top = j ? (1 - i.cycleH) : (i.cycleH - 1);
			d.animOut.top = j ? c.cycleH : -c.cycleH
		});
		a.cssFirst.top = 0;
		a.cssBefore.left = 0;
		a.animIn.top = 0;
		a.animOut.left = 0
	};
	b.fn.cycle.transitions.slideX = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b(d.elements).not(c).hide();
			b.fn.cycle.commonReset(c, h, d, false, true);
			d.animIn.width = h.cycleW
		});
		a.cssBefore.left = 0;
		a.cssBefore.top = 0;
		a.cssBefore.width = 0;
		a.animIn.width = "show";
		a.animOut.width = 0
	};
	b.fn.cycle.transitions.slideY = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b(d.elements).not(c).hide();
			b.fn.cycle.commonReset(c, h, d, true, false);
			d.animIn.height = h.cycleH
		});
		a.cssBefore.left = 0;
		a.cssBefore.top = 0;
		a.cssBefore.height = 0;
		a.animIn.height = "show";
		a.animOut.height = 0
	};
	b.fn.cycle.transitions.shuffle = function(h, g, i) {
		var j, a = h.css("overflow", "visible").width();
		g.css({
			left : 0,
			top : 0
		});
		i.before.push(function(c, e, d) {
			b.fn.cycle.commonReset(c, e, d, true, true, true)
		});
		if (!i.speedAdjusted) {
			i.speed = i.speed / 2;
			i.speedAdjusted = true
		}
		i.random = 0;
		i.shuffle = i.shuffle || {
			left : -a,
			top : 15
		};
		i.els = [];
		for (j = 0; j < g.length; j++) {
			i.els.push(g[j])
		}
		for (j = 0; j < i.currSlide; j++) {
			i.els.push(i.els.shift())
		}
		i.fxFn = function(c, f, d, q, n) {
			if (d.rev) {
				n = !n
			}
			var o = n ? b(c) : b(f);
			b(f).css(d.cssBefore);
			var e = d.slideCount;
			o.animate(d.shuffle, d.speedIn, d.easeIn, function() {
				var t = b.fn.cycle.hopsFromLast(d, n);
				for ( var m = 0; m < t; m++) {
					n ? d.els.push(d.els.shift()) : d.els.unshift(d.els.pop())
				}
				if (n) {
					for ( var l = 0, u = d.els.length; l < u; l++) {
						b(d.els[l]).css("z-index", u - l + e)
					}
				} else {
					var k = b(c).css("z-index");
					o.css("z-index", parseInt(k, 10) + 1 + e)
				}
				o.animate({
					left : 0,
					top : 0
				}, d.speedOut, d.easeOut, function() {
					b(n ? this : c).hide();
					if (q) {
						q()
					}
				})
			})
		};
		b.extend(i.cssBefore, {
			display : "block",
			opacity : 1,
			top : 0,
			left : 0
		})
	};
	b.fn.cycle.transitions.turnUp = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, true, false);
			d.cssBefore.top = h.cycleH;
			d.animIn.height = h.cycleH;
			d.animOut.width = h.cycleW
		});
		a.cssFirst.top = 0;
		a.cssBefore.left = 0;
		a.cssBefore.height = 0;
		a.animIn.top = 0;
		a.animOut.height = 0
	};
	b.fn.cycle.transitions.turnDown = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, true, false);
			d.animIn.height = h.cycleH;
			d.animOut.top = c.cycleH
		});
		a.cssFirst.top = 0;
		a.cssBefore.left = 0;
		a.cssBefore.top = 0;
		a.cssBefore.height = 0;
		a.animOut.height = 0
	};
	b.fn.cycle.transitions.turnLeft = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, false, true);
			d.cssBefore.left = h.cycleW;
			d.animIn.width = h.cycleW
		});
		a.cssBefore.top = 0;
		a.cssBefore.width = 0;
		a.animIn.left = 0;
		a.animOut.width = 0
	};
	b.fn.cycle.transitions.turnRight = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, false, true);
			d.animIn.width = h.cycleW;
			d.animOut.left = c.cycleW
		});
		b.extend(a.cssBefore, {
			top : 0,
			left : 0,
			width : 0
		});
		a.animIn.left = 0;
		a.animOut.width = 0
	};
	b.fn.cycle.transitions.zoom = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, false, false, true);
			d.cssBefore.top = h.cycleH / 2;
			d.cssBefore.left = h.cycleW / 2;
			b.extend(d.animIn, {
				top : 0,
				left : 0,
				width : h.cycleW,
				height : h.cycleH
			});
			b.extend(d.animOut, {
				width : 0,
				height : 0,
				top : c.cycleH / 2,
				left : c.cycleW / 2
			})
		});
		a.cssFirst.top = 0;
		a.cssFirst.left = 0;
		a.cssBefore.width = 0;
		a.cssBefore.height = 0
	};
	b.fn.cycle.transitions.fadeZoom = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, false, false);
			d.cssBefore.left = h.cycleW / 2;
			d.cssBefore.top = h.cycleH / 2;
			b.extend(d.animIn, {
				top : 0,
				left : 0,
				width : h.cycleW,
				height : h.cycleH
			})
		});
		a.cssBefore.width = 0;
		a.cssBefore.height = 0;
		a.animOut.opacity = 0
	};
	b.fn.cycle.transitions.blindX = function(g, f, h) {
		var a = g.css("overflow", "hidden").width();
		h.before.push(function(c, e, d) {
			b.fn.cycle.commonReset(c, e, d);
			d.animIn.width = e.cycleW;
			d.animOut.left = c.cycleW
		});
		h.cssBefore.left = a;
		h.cssBefore.top = 0;
		h.animIn.left = 0;
		h.animOut.left = a
	};
	b.fn.cycle.transitions.blindY = function(g, f, h) {
		var a = g.css("overflow", "hidden").height();
		h.before.push(function(c, e, d) {
			b.fn.cycle.commonReset(c, e, d);
			d.animIn.height = e.cycleH;
			d.animOut.top = c.cycleH
		});
		h.cssBefore.top = a;
		h.cssBefore.left = 0;
		h.animIn.top = 0;
		h.animOut.top = a
	};
	b.fn.cycle.transitions.blindZ = function(h, g, i) {
		var j = h.css("overflow", "hidden").height();
		var a = h.width();
		i.before.push(function(c, e, d) {
			b.fn.cycle.commonReset(c, e, d);
			d.animIn.height = e.cycleH;
			d.animOut.top = c.cycleH
		});
		i.cssBefore.top = j;
		i.cssBefore.left = a;
		i.animIn.top = 0;
		i.animIn.left = 0;
		i.animOut.top = j;
		i.animOut.left = a
	};
	b.fn.cycle.transitions.growX = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, false, true);
			d.cssBefore.left = this.cycleW / 2;
			d.animIn.left = 0;
			d.animIn.width = this.cycleW;
			d.animOut.left = 0
		});
		a.cssBefore.top = 0;
		a.cssBefore.width = 0
	};
	b.fn.cycle.transitions.growY = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, true, false);
			d.cssBefore.top = this.cycleH / 2;
			d.animIn.top = 0;
			d.animIn.height = this.cycleH;
			d.animOut.top = 0
		});
		a.cssBefore.height = 0;
		a.cssBefore.left = 0
	};
	b.fn.cycle.transitions.curtainX = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, false, true, true);
			d.cssBefore.left = h.cycleW / 2;
			d.animIn.left = 0;
			d.animIn.width = this.cycleW;
			d.animOut.left = c.cycleW / 2;
			d.animOut.width = 0
		});
		a.cssBefore.top = 0;
		a.cssBefore.width = 0
	};
	b.fn.cycle.transitions.curtainY = function(f, e, a) {
		a.before.push(function(c, h, d) {
			b.fn.cycle.commonReset(c, h, d, true, false, true);
			d.cssBefore.top = h.cycleH / 2;
			d.animIn.top = 0;
			d.animIn.height = h.cycleH;
			d.animOut.top = c.cycleH / 2;
			d.animOut.height = 0
		});
		a.cssBefore.height = 0;
		a.cssBefore.left = 0
	};
	b.fn.cycle.transitions.cover = function(j, h, k) {
		var d = k.direction || "left";
		var a = j.css("overflow", "hidden").width();
		var l = j.height();
		k.before.push(function(c, f, e) {
			b.fn.cycle.commonReset(c, f, e);
			if (d == "right") {
				e.cssBefore.left = -a
			} else {
				if (d == "up") {
					e.cssBefore.top = l
				} else {
					if (d == "down") {
						e.cssBefore.top = -l
					} else {
						e.cssBefore.left = a
					}
				}
			}
		});
		k.animIn.left = 0;
		k.animIn.top = 0;
		k.cssBefore.top = 0;
		k.cssBefore.left = 0
	};
	b.fn.cycle.transitions.uncover = function(j, h, k) {
		var d = k.direction || "left";
		var a = j.css("overflow", "hidden").width();
		var l = j.height();
		k.before.push(function(c, f, e) {
			b.fn.cycle.commonReset(c, f, e, true, true, true);
			if (d == "right") {
				e.animOut.left = a
			} else {
				if (d == "up") {
					e.animOut.top = -l
				} else {
					if (d == "down") {
						e.animOut.top = l
					} else {
						e.animOut.left = -a
					}
				}
			}
		});
		k.animIn.left = 0;
		k.animIn.top = 0;
		k.cssBefore.top = 0;
		k.cssBefore.left = 0
	};
	b.fn.cycle.transitions.toss = function(h, g, i) {
		var a = h.css("overflow", "visible").width();
		var j = h.height();
		i.before.push(function(c, e, d) {
			b.fn.cycle.commonReset(c, e, d, true, true, true);
			if (!d.animOut.left && !d.animOut.top) {
				b.extend(d.animOut, {
					left : a * 2,
					top : -j / 2,
					opacity : 0
				})
			} else {
				d.animOut.opacity = 0
			}
		});
		i.cssBefore.left = 0;
		i.cssBefore.top = 0;
		i.animIn.left = 0
	};
	b.fn.cycle.transitions.wipe = function(B, l, y) {
		var a = B.css("overflow", "hidden").width();
		var t = B.height();
		y.cssBefore = y.cssBefore || {};
		var w;
		if (y.clip) {
			if (/l2r/.test(y.clip)) {
				w = "rect(0px 0px " + t + "px 0px)"
			} else {
				if (/r2l/.test(y.clip)) {
					w = "rect(0px " + a + "px " + t + "px " + a + "px)"
				} else {
					if (/t2b/.test(y.clip)) {
						w = "rect(0px " + a + "px 0px 0px)"
					} else {
						if (/b2t/.test(y.clip)) {
							w = "rect(" + t + "px " + a + "px " + t + "px 0px)"
						} else {
							if (/zoom/.test(y.clip)) {
								var d = parseInt(t / 2, 10);
								var x = parseInt(a / 2, 10);
								w = "rect(" + d + "px " + x + "px " + d + "px "
										+ x + "px)"
							}
						}
					}
				}
			}
		}
		y.cssBefore.clip = y.cssBefore.clip || w || "rect(0px 0px 0px 0px)";
		var r = y.cssBefore.clip.match(/(\d+)/g);
		var A = parseInt(r[0], 10), z = parseInt(r[1], 10), h = parseInt(r[2],
				10), v = parseInt(r[3], 10);
		y.before.push(function(f, j, i) {
			if (f == j) {
				return
			}
			var m = b(f), c = b(j);
			b.fn.cycle.commonReset(f, j, i, true, true, false);
			i.cssAfter.display = "block";
			var k = 1, e = parseInt((i.speedIn / 13), 10) - 1;
			(function g() {
				var s = A ? A - parseInt(k * (A / e), 10) : 0;
				var q = v ? v - parseInt(k * (v / e), 10) : 0;
				var o = h < t ? h + parseInt(k * ((t - h) / e || 1), 10) : t;
				var n = z < a ? z + parseInt(k * ((a - z) / e || 1), 10) : a;
				c.css({
					clip : "rect(" + s + "px " + n + "px " + o + "px " + q
							+ "px)"
				});
				(k++ <= e) ? setTimeout(g, 13) : m.css("display", "none")
			})()
		});
		b.extend(y.cssBefore, {
			display : "block",
			opacity : 1,
			top : 0,
			left : 0
		});
		y.animIn = {
			left : 0
		};
		y.animOut = {
			left : 0
		}
	}
})(jQuery);
jQuery.easing.jswing = jQuery.easing.swing;
jQuery.extend(jQuery.easing, {
	def : "easeOutQuad",
	swing : function(j, i, b, c, d) {
		return jQuery.easing[jQuery.easing.def](j, i, b, c, d)
	},
	easeInQuad : function(j, i, b, c, d) {
		return c * (i /= d) * i + b
	},
	easeOutQuad : function(j, i, b, c, d) {
		return -c * (i /= d) * (i - 2) + b
	},
	easeInOutQuad : function(j, i, b, c, d) {
		if ((i /= d / 2) < 1) {
			return c / 2 * i * i + b
		}
		return -c / 2 * ((--i) * (i - 2) - 1) + b
	},
	easeInCubic : function(j, i, b, c, d) {
		return c * (i /= d) * i * i + b
	},
	easeOutCubic : function(j, i, b, c, d) {
		return c * ((i = i / d - 1) * i * i + 1) + b
	},
	easeInOutCubic : function(j, i, b, c, d) {
		if ((i /= d / 2) < 1) {
			return c / 2 * i * i * i + b
		}
		return c / 2 * ((i -= 2) * i * i + 2) + b
	},
	easeInQuart : function(j, i, b, c, d) {
		return c * (i /= d) * i * i * i + b
	},
	easeOutQuart : function(j, i, b, c, d) {
		return -c * ((i = i / d - 1) * i * i * i - 1) + b
	},
	easeInOutQuart : function(j, i, b, c, d) {
		if ((i /= d / 2) < 1) {
			return c / 2 * i * i * i * i + b
		}
		return -c / 2 * ((i -= 2) * i * i * i - 2) + b
	},
	easeInQuint : function(j, i, b, c, d) {
		return c * (i /= d) * i * i * i * i + b
	},
	easeOutQuint : function(j, i, b, c, d) {
		return c * ((i = i / d - 1) * i * i * i * i + 1) + b
	},
	easeInOutQuint : function(j, i, b, c, d) {
		if ((i /= d / 2) < 1) {
			return c / 2 * i * i * i * i * i + b
		}
		return c / 2 * ((i -= 2) * i * i * i * i + 2) + b
	},
	easeInSine : function(j, i, b, c, d) {
		return -c * Math.cos(i / d * (Math.PI / 2)) + c + b
	},
	easeOutSine : function(j, i, b, c, d) {
		return c * Math.sin(i / d * (Math.PI / 2)) + b
	},
	easeInOutSine : function(j, i, b, c, d) {
		return -c / 2 * (Math.cos(Math.PI * i / d) - 1) + b
	},
	easeInExpo : function(j, i, b, c, d) {
		return (i == 0) ? b : c * Math.pow(2, 10 * (i / d - 1)) + b
	},
	easeOutExpo : function(j, i, b, c, d) {
		return (i == d) ? b + c : c * (-Math.pow(2, -10 * i / d) + 1) + b
	},
	easeInOutExpo : function(j, i, b, c, d) {
		if (i == 0) {
			return b
		}
		if (i == d) {
			return b + c
		}
		if ((i /= d / 2) < 1) {
			return c / 2 * Math.pow(2, 10 * (i - 1)) + b
		}
		return c / 2 * (-Math.pow(2, -10 * --i) + 2) + b
	},
	easeInCirc : function(j, i, b, c, d) {
		return -c * (Math.sqrt(1 - (i /= d) * i) - 1) + b
	},
	easeOutCirc : function(j, i, b, c, d) {
		return c * Math.sqrt(1 - (i = i / d - 1) * i) + b
	},
	easeInOutCirc : function(j, i, b, c, d) {
		if ((i /= d / 2) < 1) {
			return -c / 2 * (Math.sqrt(1 - i * i) - 1) + b
		}
		return c / 2 * (Math.sqrt(1 - (i -= 2) * i) + 1) + b
	},
	easeInElastic : function(o, m, q, a, b) {
		var d = 1.70158;
		var c = 0;
		var n = a;
		if (m == 0) {
			return q
		}
		if ((m /= b) == 1) {
			return q + a
		}
		if (!c) {
			c = b * 0.3
		}
		if (n < Math.abs(a)) {
			n = a;
			var d = c / 4
		} else {
			var d = c / (2 * Math.PI) * Math.asin(a / n)
		}
		return -(n * Math.pow(2, 10 * (m -= 1)) * Math.sin((m * b - d)
				* (2 * Math.PI) / c))
				+ q
	},
	easeOutElastic : function(o, m, q, a, b) {
		var d = 1.70158;
		var c = 0;
		var n = a;
		if (m == 0) {
			return q
		}
		if ((m /= b) == 1) {
			return q + a
		}
		if (!c) {
			c = b * 0.3
		}
		if (n < Math.abs(a)) {
			n = a;
			var d = c / 4
		} else {
			var d = c / (2 * Math.PI) * Math.asin(a / n)
		}
		return n * Math.pow(2, -10 * m)
				* Math.sin((m * b - d) * (2 * Math.PI) / c) + a + q
	},
	easeInOutElastic : function(o, m, q, a, b) {
		var d = 1.70158;
		var c = 0;
		var n = a;
		if (m == 0) {
			return q
		}
		if ((m /= b / 2) == 2) {
			return q + a
		}
		if (!c) {
			c = b * (0.3 * 1.5)
		}
		if (n < Math.abs(a)) {
			n = a;
			var d = c / 4
		} else {
			var d = c / (2 * Math.PI) * Math.asin(a / n)
		}
		if (m < 1) {
			return -0.5
					* (n * Math.pow(2, 10 * (m -= 1)) * Math.sin((m * b - d)
							* (2 * Math.PI) / c)) + q
		}
		return n * Math.pow(2, -10 * (m -= 1))
				* Math.sin((m * b - d) * (2 * Math.PI) / c) * 0.5 + a + q
	},
	easeInBack : function(l, k, b, c, d, j) {
		if (j == undefined) {
			j = 1.70158
		}
		return c * (k /= d) * k * ((j + 1) * k - j) + b
	},
	easeOutBack : function(l, k, b, c, d, j) {
		if (j == undefined) {
			j = 1.70158
		}
		return c * ((k = k / d - 1) * k * ((j + 1) * k + j) + 1) + b
	},
	easeInOutBack : function(l, k, b, c, d, j) {
		if (j == undefined) {
			j = 1.70158
		}
		if ((k /= d / 2) < 1) {
			return c / 2 * (k * k * (((j *= (1.525)) + 1) * k - j)) + b
		}
		return c / 2 * ((k -= 2) * k * (((j *= (1.525)) + 1) * k + j) + 2) + b
	},
	easeInBounce : function(j, i, b, c, d) {
		return c - jQuery.easing.easeOutBounce(j, d - i, 0, c, d) + b
	},
	easeOutBounce : function(j, i, b, c, d) {
		if ((i /= d) < (1 / 2.75)) {
			return c * (7.5625 * i * i) + b
		} else {
			if (i < (2 / 2.75)) {
				return c * (7.5625 * (i -= (1.5 / 2.75)) * i + 0.75) + b
			} else {
				if (i < (2.5 / 2.75)) {
					return c * (7.5625 * (i -= (2.25 / 2.75)) * i + 0.9375) + b
				} else {
					return c * (7.5625 * (i -= (2.625 / 2.75)) * i + 0.984375)
							+ b
				}
			}
		}
	},
	easeInOutBounce : function(j, i, b, c, d) {
		if (i < d / 2) {
			return jQuery.easing.easeInBounce(j, i * 2, 0, c, d) * 0.5 + b
		}
		return jQuery.easing.easeOutBounce(j, i * 2 - d, 0, c, d) * 0.5 + c
				* 0.5 + b
	}
});
(function(b) {
	b.fn.swipe = function(a) {
		var d = {
			threshold : {
				x : 10,
				y : 30
			},
			swipeLeft : function() {
				alert("swiped left")
			},
			swipeRight : function() {
				alert("swiped right")
			},
			swipeMoving : function(c) {
				alert(c)
			}
		};
		var a = b.extend(d, a);
		if (!this) {
			return false
		}
		return this.each(function() {
			var l = b(this);
			var n = {
				x : 0,
				y : 0
			};
			var q = {
				x : 0,
				y : 0
			};
			function o(e) {
				n.x = e.targetTouches[0].pageX;
				n.y = e.targetTouches[0].pageY
			}
			function c(e) {
				e.preventDefault();
				q.x = e.targetTouches[0].pageX;
				q.y = e.targetTouches[0].pageY;
				changeX = n.x - q.x;
				if (changeX > d.threshold.x || changeX < (d.threshold.x * -1)) {
					d.swipeMoving(changeX)
				}
			}
			function m(f) {
				var e = n.y - q.y;
				if (e < d.threshold.y && e > (d.threshold.y * -1)) {
					changeX = n.x - q.x;
					if (changeX > d.threshold.x) {
						d.swipeLeft()
					}
					if (changeX < (d.threshold.x * -1)) {
						d.swipeRight()
					}
				} else {
					if (changeX > 0) {
						d.swipeLeft()
					} else {
						d.swipeRight()
					}
				}
			}
			function o(e) {
				n.x = e.targetTouches[0].pageX;
				n.y = e.targetTouches[0].pageY;
				q.x = n.x;
				q.y = n.y
			}
			function k(e) {
			}
			this.addEventListener("touchstart", o, false);
			this.addEventListener("touchmove", c, false);
			this.addEventListener("touchend", m, false);
			this.addEventListener("touchcancel", k, false)
		})
	}
})(jQuery);