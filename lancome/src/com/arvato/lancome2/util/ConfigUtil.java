package com.arvato.lancome2.util;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.arvato.lancome2.vo.Catalog;
import com.arvato.lancome2.vo.Comment;
import com.arvato.lancome2.vo.Product;

public class ConfigUtil {
	
	protected static Logger log = Logger.getLogger(ConfigUtil.class);
	
	// 目录信息
	// private static Map<String,Catalog> catalogMap = new
	// LinkedHashMap<String,Catalog>();
	// private static Map<Integer,List<Catalog>> catalogsByLevel = new
	// HashMap<Integer,List<Catalog>>();

	// 评论信息
	// 评论信息变动对业务影响很小，直接用Map缓存，避免频繁的读取comment.json，如果改动了comment，请求config?ope=init_comment(初始化评论缓存)或者ope=clear_cache(清空全部缓存)
	// private static Map<String,Comment[]> commentMap = new
	// HashMap<String,Comment[]>();
	private static String jsonFolderPath;
	private static String contextPath;
	private static HttpAccess httpAccess = new HttpAccess();

	// public static void initCatalog(){
	// if(log.isInfoEnabled()){
	// log.info("json 配置文件路径："+jsonFolderPath+"/catalog.json");
	// log.info("开始初始化目录信息");
	// }
	// try {
	// JSONArray catalogArray = new JSONArray(FileUtils.readFileToString(new
	// File(jsonFolderPath+"/catalog.json"), "UTF-8"));
	// initCatalogMap(catalogArray);
	// log.info("初始化目录信息成功");
	// } catch (JSONException e) {
	// log.error(e.getMessage(), e);
	// } catch (IOException e) {
	// log.error(e.getMessage(), e);
	// }
	// }

	public static void initCatalog() {
		if (log.isInfoEnabled()) {
			log.info("目录 json 配置文件路径：" + jsonFolderPath + "/catalog.json");
			log.info("开始初始化目录信息");
		}
		try {
			JSONArray catalogArray = new JSONArray(FileUtils.readFileToString(new File(jsonFolderPath + "/catalog.json"), "UTF-8"));
			initCatalogCache(catalogArray);
			initProductCache(catalogArray);
			
			Date date = new Date();
			CacheUtil.setObjectCache("loadedProductsTime", date);
			
			log.info("初始化目录信息成功");
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}
	}
	
	// public static void initComment(){
	// if(log.isInfoEnabled()){
	// log.info("评论 json 配置文件路径："+jsonFolderPath+"/comment.json");
	// log.info("开始初始化评论信息");
	// }
	// try {
	// JSONArray commentArray = new JSONArray(FileUtils.readFileToString(new
	// File(jsonFolderPath+"/comment.json"), "UTF-8"));
	// initCommentCache(commentArray);
	// log.info("初始化评论信息成功");
	// } catch (JSONException e) {
	// log.error(e.getMessage(), e);
	// } catch (IOException e) {
	// log.error(e.getMessage(), e);
	// }
	// }

	public static Catalog getCatalog(String catalogId) {
		Object resultObj = CacheUtil.getObjectCache("catalog_" + catalogId);
		if (resultObj == null) {
			initCatalog();
			resultObj = CacheUtil.getObjectCache("catalog_" + catalogId);
		}
		return resultObj == null ? null : (Catalog) resultObj;
	}

	// public static List<Catalog> getCatalogsByLevel(int level){
	// if(!catalogsByLevel.containsKey(level)){
	// Catalog tmpCatalog = null;
	// List<Catalog> catalogs = new ArrayList<Catalog>();
	// for(Iterator<Entry<String,Catalog>> it =
	// catalogMap.entrySet().iterator();it.hasNext();){
	// tmpCatalog = it.next().getValue();
	// if(tmpCatalog.getLevel()==level){
	// catalogs.add(tmpCatalog);
	// }
	// }
	// catalogsByLevel.put(level, catalogs);
	// }
	// return catalogsByLevel.get(level);
	// }

	public static List<Catalog> getCatalogsByLevel(int level) {
		Object resultObj = CacheUtil.getObjectCache("catalog_level_" + level);
		if (resultObj == null) {
			initCatalog();
			resultObj = CacheUtil.getObjectCache("catalog_level_" + level);
		}
		return resultObj == null ? null : (List<Catalog>) resultObj;
	}

	// public static Comment[] getCommentsById(String commentId){
	// return commentMap.get(commentId);
	// }

	public static boolean addComment(Comment comment) {
		NameValuePair[] paramsBody = new NameValuePair[] { new NameValuePair("email", "arvato_system@163.com"), new NameValuePair("pcode", comment.getPcode()), new NameValuePair("comment", comment.getContent()), new NameValuePair("reviewlevel", String.valueOf(comment.getScore())), null };
		int endIdx = paramsBody.length - 1;

		StringBuilder content = new StringBuilder();
		content.append("email=arvato_system@163.com&pcode=").append(comment.getPcode()).append("&comment=").append(comment.getContent()).append("&reviewlevel=").append(comment.getScore()).append("2505307234334bb08fa0c855a8933ab0");

		// for(int i=0;i<endIdx;i++){
		// content.append(paramsBody[i].getName()).append("=").append(paramsBody[i].getValue()).append("&");
		// }

		// String sign = MD5.getHashString(content.toString());
		String sign = getMD5(content.toString());
		
		if (log.isDebugEnabled()) {
			log.debug("comment info:" + content.toString());
			log.debug("sign:" + sign);
		}
		
		paramsBody[endIdx] = new NameValuePair("sign", sign);

		content = null;

		String result = httpAccess.sendPostRequest("http://user.lancome.com.cn/ReviewForMobile.aspx/AddProductReview", paramsBody);
		if (log.isDebugEnabled()) {
			log.debug("add comment result:" + result);
		}
		if (result != null && "1".equals(result.trim())) {
			return true;
		}

		return false;
	}

	public static Comment[] getCommentsByPCode(String pCode) {
		Object obj = CacheUtil.getObjectCache("comments_" + pCode);
		Comment[] result = null;
		if (obj != null) {
			result = (Comment[]) obj;
		} else {
			String strResult = httpAccess.sendGetRequest("http://user.lancome.com.cn/ReviewForMobile.aspx?jsonpcallback=a&pcode=" + pCode);
			if (strResult != null && strResult.length() > 3) {
				try {
					JSONArray commArr = new JSONObject(strResult.substring(2, strResult.length() - 1)).getJSONArray("RecordDetail");
					int l = commArr.length();
					JSONObject tmpObj = null;
					Comment tmpComment = null;
					if (l > 0) {
						if (l > 20) {
							l = 20;// 只取前20条记录
						}
						result = new Comment[l];
					}
					DateFormat commDf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String tmpDateStr = null;
					Date d = null;
					for (int i = 0; i < l; i++) {
						tmpObj = commArr.getJSONObject(i);
						tmpComment = new Comment();
						tmpDateStr = tmpObj.getString("ReviewDate");
						try {
							d = new Date(Long.parseLong(tmpDateStr.substring(6, tmpDateStr.length() - 2)));
						} catch (NumberFormatException nfe) {
							log.error(nfe.getMessage(), nfe);
						}
						if (d != null) {
							tmpComment.setDate(commDf.format(d));
						}
						tmpComment.setScore(tmpObj.getInt("ReviewLevel"));
						tmpComment.setName(tmpObj.getString("ReviewName"));
						if ("".equals(tmpComment.getName())) {
							tmpComment.setName("匿名用户");
						}
						tmpComment.setContent(tmpObj.getString("Comment"));
						result[i] = tmpComment;
					}
					if (result != null) {
						CacheUtil.setObjectCache("comments_" + pCode, result);
					}
				} catch (JSONException e) {
					log.error(e.getMessage(), e);
				}
			}
		}
		return result;
	}

	public static String getProductJson(String id) throws IOException {
		String json = CacheUtil.getStringCache("product_" + id);
		if (json == null) {
			File f = new File(jsonFolderPath + "/" + id + ".json");
			if (f.exists()) {
				// if(log.isDebugEnabled()){
				// log.debug("读取json文件："+jsonFolderPath+"/"+f.getName());
				// }
				json = FileUtils.readFileToString(f, "UTF-8");
				CacheUtil.setStringCache("product_" + id, json);
			} else {
				throw new IOException(id + ".json does not exist");
			}
		}
		return json;
	}

	public static String getProductsJsonByCatalogId(String cid) {
		String resultJson = CacheUtil.getStringCache("productsOfCatalog_" + cid);
		if (resultJson == null) {
			Catalog c = getCatalog(cid);
			String ids = c.getIds();
			JSONArray result = new JSONArray();
			if (ids != null) {
				String[] idsArray = ids.split("\\|");
				JSONObject tmpObj = null;
				for (int i = 0; i < idsArray.length; i++) {
					try {
						tmpObj = new JSONObject(getProductJson(idsArray[i]));
						result.put(tmpObj);
					} catch (JSONException e) {
						log.error(e.getMessage(), e);
					} catch (IOException e) {
						log.error(e.getMessage(), e);
					}
				}
				resultJson = result.toString();
				CacheUtil.setStringCache("productsOfCatalog_" + cid, resultJson);
			}
		}
		return resultJson;
	}

	public static Product getProduct(String id) throws IOException {
		Object obj = CacheUtil.getObjectCache("product_obj_" + id);
		Product result = null;
		if (obj != null) {
			result = (Product) obj;
		} else {
			File f = new File(jsonFolderPath + "/" + id + ".json");
			if (f.exists()) {
				// if(log.isDebugEnabled()){
				// log.debug("读取json文件："+jsonFolderPath+"/"+f.getName());
				// }
				String json = FileUtils.readFileToString(f, "UTF-8");
				try {
					JSONObject jsonObj = new JSONObject(json);
					Product p = new Product();

					p.setId(jsonObj.getString("id"));

					// 文件名与id不相同的情况
					p.setFileid(id);

					p.setName(jsonObj.getString("name"));
					p.setDesc(jsonObj.getString("desc"));
					p.setGiftid(jsonObj.getString("giftid"));
					String price = jsonObj.getString("price");
					if (StringUtils.isEmpty(price))
					{
						JSONArray jsonArr = jsonObj.getJSONArray("products");
						if (jsonArr != null && jsonArr.length() > 0)
						{
							JSONObject product = jsonArr.getJSONObject(0);
							if (product != null)
							{
								price = product.getString("price");
							}
						}
					}
					p.setPrice(price);
					String capacity = "";
					if (jsonObj.has("capacity"))
						capacity = jsonObj.getString("capacity");
					if (StringUtils.isEmpty(capacity))
					{
						JSONArray jsonArr = jsonObj.getJSONArray("products");
						if (jsonArr != null && jsonArr.length() > 0)
						{
							JSONObject product = jsonArr.getJSONObject(0);
							if (product != null)
							{
								capacity = product.getString("capacity");
							}
						}
					}
					p.setCapacity(capacity);
					p.setIngredient(jsonObj.getString("ingredient"));
					p.setGuide(jsonObj.getString("guide"));
					String tmpImgs = jsonObj.getString("imgs");
					if (tmpImgs != null) {
						if (tmpImgs.substring(0, 1).equals("/") || tmpImgs.indexOf("http") != -1) {
							// p.setImgs("http://mg.lancome.com.cn"+tmpImgs);
							p.setImgs(tmpImgs);
						} else {
							p.setImgs(contextPath + "/" + tmpImgs);
						}
						tmpImgs = null;
					}
					p.setEfficacy(jsonObj.getString("efficacy"));
					p.setCommentid(jsonObj.getString("commentid"));
					if ("".equals(p.getCommentid())) {
						p.setCommentid(p.getId());
					}
					p.setRecommend(jsonObj.getString("recommend"));
					p.setOffer(jsonObj.getString("offer"));

					JSONArray productsArray = jsonObj.getJSONArray("products");
					if (productsArray != null && productsArray.length() > 0) {
						p.setClassify(jsonObj.getString("classify"));
						int l = productsArray.length();
						Product[] products = new Product[l];
						Product subProduct = null;
						JSONObject tmpObj = null;
						for (int i = 0; i < l; i++) {
							tmpObj = productsArray.getJSONObject(i);
							subProduct = new Product();
							subProduct.setId(tmpObj.getString("id"));
							subProduct.setPcode(tmpObj.getString("pcode"));
							subProduct.setColor(tmpObj.getString("color"));
							subProduct.setRgb(tmpObj.getString("rgb"));
							subProduct.setCapacity(tmpObj.getString("capacity"));
							subProduct.setPrice(tmpObj.getString("price"));

							products[i] = subProduct;
						}
						p.setProducts(products);
					} else {
						p.setPcode(jsonObj.getString("pcode"));
					}
					result = p;
					CacheUtil.setObjectCache("product_obj_" + id, result);
				} catch (JSONException e) {
					log.error(e.getMessage(), e);
				}
			} else {
				throw new IOException(id + ".json does not exist");
			}
		}
		return result;
	}

	/*public static Product[] getProductsByCatalogId(String cid) {
		Object resultObj = CacheUtil.getObjectCache("productObjsOfCatalog_" + cid);
		Product[] result = null;
		if (resultObj == null) {
			Catalog c = getCatalog(cid);
			String ids = c.getIds();
			if (ids != null) {
				String[] idsArray = ids.split("\\|");
				Product tmpProduct = null;
				result = new Product[idsArray.length];
				for (int i = 0; i < idsArray.length; i++) {
					try {
						tmpProduct = getProduct(idsArray[i]);
						if (tmpProduct != null) {
							result[i] = tmpProduct;
						}
					} catch (IOException e) {
						log.error(e.getMessage(), e);
					}
				}
				CacheUtil.setObjectCache("productObjsOfCatalog_" + cid, result);
			}
		} else {
			result = (Product[]) resultObj;
		}
		return result;
	}*/
	
	public static Product[] getProductsByCatalogId(String cid)
	{
		Object resultObj = CacheUtil.getObjectCache("productObjsOfCatalog_" + cid);
		Product[] result = null;
		if (resultObj == null) {
			Catalog c = getCatalog(cid);
			String ids = c.getIds();
			if (ids != null) {
				String[] idsArray = ids.split("\\|");
				Product tmpProduct = null;
				List list = new ArrayList();
				for (int i = 0; i < idsArray.length; i++) {
					try {
						tmpProduct = getProduct(idsArray[i]);
						if (tmpProduct != null) {
	                        tmpProduct.setCid(cid);
							list.add(tmpProduct);
							
							List productsList = (List) CacheUtil.getObjectCache("products_list");
							if (productsList != null && !productsList.contains(tmpProduct))
							{
								productsList.add(tmpProduct);
								CacheUtil.setObjectCache("products_list", productsList);
							}
						}
						else
						{
						    log.info("invalid file: " + idsArray[i] + ".json");
						}
					} catch (IOException e) {
						log.error(e.getMessage(), e);
					}
				}
				if (list.size() > 0)
					result = (Product[]) list.toArray(new Product[list.size()]);
				CacheUtil.setObjectCache("productObjsOfCatalog_" + cid, result);
			}
		} else {
			result = (Product[]) resultObj;
		}
		return result;
	}
	
	public static void setJsonFolderPath(String folderPath) {
		jsonFolderPath = folderPath;
	}

	public static void setContextPath(String contextPath) {
		ConfigUtil.contextPath = contextPath;
	}

	public static void clearCache() {
		CacheUtil.clearCache();
	}

	public static void closeCache() {
		CacheUtil.closeCache();
	}

	private static void initCatalogCache(JSONArray catalogArray) throws JSONException {
		if (catalogArray != null && catalogArray.length() > 0) {
			// catalogMap.clear();
			// catalogsByLevel.clear();
			JSONObject tmpObj = null;
			Catalog tmpCatalog = null;
			List<Catalog> catalog0 = new ArrayList<Catalog>();
			List<Catalog> catalog1 = new ArrayList<Catalog>();
			for (int i = 0; i < catalogArray.length(); i++) {
				tmpObj = catalogArray.getJSONObject(i);
				tmpCatalog = new Catalog();
				tmpCatalog.setId(tmpObj.getString("id"));
				tmpCatalog.setName(tmpObj.getString("name"));
				tmpCatalog.setImg(tmpObj.getString("img"));
				tmpCatalog.setLink(tmpObj.getString("link"));
				if(tmpObj.has("ids")){
				    tmpCatalog.setIds(tmpObj.getString("ids"));
				}
				tmpCatalog.setLevel(0);
				if (tmpObj.has("ids"))
					tmpCatalog.setIds(tmpObj.getString("ids"));
				
				if (tmpObj.has("subCategory")) {
					JSONObject tmpCategory = null;
					JSONArray subCategorys = tmpObj.getJSONArray("subCategory");
					int len = subCategorys.length();
					Catalog[] catalogs = new Catalog[len];
					Catalog subCatalog = null;
					for (int j = 0; j < len; j++) {
						tmpCategory = subCategorys.getJSONObject(j);
						subCatalog = new Catalog();
						subCatalog.setId(tmpCategory.getString("id"));
						subCatalog.setName(tmpCategory.getString("name"));
						subCatalog.setIntro(tmpCategory.getString("intro"));
						subCatalog.setIds(tmpCategory.getString("ids"));
						subCatalog.setParentCatalog(tmpCatalog);
						subCatalog.setLevel(1);
						catalogs[j] = subCatalog;
						catalog1.add(subCatalog);
						CacheUtil.setObjectCache("catalog_" + subCatalog.getId(), subCatalog);
						// catalogMap.put(subCatalog.getId(),subCatalog);
					}
					tmpCatalog.setSubCategory(catalogs);
				}
				catalog0.add(tmpCatalog);
				CacheUtil.setObjectCache("catalog_" + tmpCatalog.getId(), tmpCatalog);
				// catalogMap.put(tmpCatalog.getId(), tmpCatalog);
			}
			CacheUtil.setObjectCache("catalog_level_0", catalog0);
			CacheUtil.setObjectCache("catalog_level_1", catalog1);
			catalog0 = null;
			catalog1 = null;
		}
	}

	private static void initProductCache(JSONArray catalogArray) throws JSONException {
		if (catalogArray != null && catalogArray.length() > 0) {
			List productsList = new ArrayList();
			for (int i = 0; i < catalogArray.length(); i++) {
				JSONObject tmpObj = catalogArray.getJSONObject(i);
				
				if (tmpObj.has("subCategory")) {
					JSONArray subCategorys = tmpObj.getJSONArray("subCategory");
					for (int j = 0; j < subCategorys.length(); j++) {
						JSONObject tmpCategory = subCategorys.getJSONObject(j);
						Product[] products = ConfigUtil.getProductsByCatalogId(tmpCategory.getString("id"));
						if (ArrayUtils.isEmpty(products))
							continue;

						//productsList.addAll(Arrays.asList(products));
						for (int z = 0; z < products.length; z++)
						{
							if (!productsList.contains(products[z]))
								productsList.add(products[z]);
						}
					}
				}
			}
			CacheUtil.setObjectCache("products_list", productsList);
		}
	}

	// private static void initCommentCache(JSONArray commentArray) throws
	// JSONException{
	// commentMap.clear();
	// if(commentArray!=null && commentArray.length()>0){
	// JSONObject tmpObj = null;
	// JSONArray tmpArray = null;
	// int l1 = commentArray.length();
	// for(int i=0;i<l1;i++){
	// tmpObj = commentArray.getJSONObject(i);
	// tmpArray = tmpObj.getJSONArray("comments");
	// if(tmpArray!=null&&tmpArray.length()>0){
	// JSONObject tmpCommentObj = null;
	// Comment tmpComment = null;
	// int l2 = tmpArray.length();
	// Comment[] tmpComments = new Comment[l2];
	// String tmpScore = null;
	// for(int j=0;j<l2;j++){
	// tmpCommentObj = tmpArray.getJSONObject(j);
	// tmpComment = new Comment();
	// tmpComment.setDate(tmpCommentObj.getString("date"));
	// tmpScore = tmpCommentObj.getString("score");
	// if(tmpScore!=null && !tmpScore.trim().equals("")){
	// tmpComment.setScore(Integer.parseInt(tmpScore));
	// }else{
	// tmpComment.setScore(0);
	// }
	// tmpComment.setName(tmpCommentObj.getString("name"));
	// tmpComment.setContent(tmpCommentObj.getString("content"));
	// tmpComments[j] = tmpComment;
	// }
	// commentMap.put(tmpObj.getString("id"), tmpComments);
	// }
	// }
	// }
	// }

	private static String getMD5(String str) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			log.error(e.getMessage(), e);
		}
		try {
			md.update(str.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			log.error(e.getMessage(), e);
		}
		byte[] bs = md.digest();
		StringBuilder md5strs = new StringBuilder();
		for (int i = 0; i < bs.length; i++) {
			int v = bs[i] & 0xff;
			if (v < 16) {
				md5strs.append(0);
			}
			md5strs.append(Integer.toHexString(v));
		}
		md = null;
		return md5strs.toString();
	}

	//public static void main(String[] args) {
		/*
		 * Date d = new Date(1342670774203l); DateFormat commDf=new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 * System.out.println(commDf.format(d));
		 */
		// getCommentsByPCode("LS00056");//LS00056
	//}
	/*
	 * public static void main(String[] args) throws JSONException { JSONObject
	 * o = new JSONObject(); o.put("name", "• abc<br />");
	 * System.out.println(o.toString()); }
	 */
}
