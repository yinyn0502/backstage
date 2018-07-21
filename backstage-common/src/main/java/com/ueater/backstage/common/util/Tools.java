package com.ueater.backstage.common.util;

import com.ueater.backstage.common.model.SysMenu;
import com.ueater.backstage.common.model.couponmanage.JsonActivityProductDTO;
import org.apache.commons.lang.StringUtils;
import org.assertj.core.util.Lists;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Tools {

	/**
	 * 随机生成六位数验证码
	 * @return
	 */
	public static int getRandomNum() {
		Random r = new Random();
		return r.nextInt(900000) + 100000;// (Math.random()*(999999-100000)+100000)
	}

	/**
	 * 检测字符串是否不为空(null,"","null")
	 * @param s
	 * @return 不为空则返回true，否则返回false
	 */
	public static boolean notEmpty(String s) {
		return s != null && !"".equals(s) && !"null".equals(s);
	}

	/**
	 * 检测字符串是否为空(null,"","null")
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(String s) {
		return s == null || "".equals(s) || "null".equals(s);
	}

	/**
	 * 字符串转换为字符串数组
	 * @param str 字符串
	 * @param splitRegex 分隔符
	 * @return
	 */
	public static String[] str2StrArray(String str, String splitRegex) {
		if (isEmpty(str)) {
			return null;
		}
		return str.split(splitRegex);
	}

	/**
	 * 用默认的分隔符(,)将字符串转换为字符串数组
	 * @param str 字符串
	 * @return
	 */
	public static String[] str2StrArray(String str) {
		return str2StrArray(str, ",\\s*");
	}

	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String date2Str(Date date) {
		return date2Str(date, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
	 * @param date
	 * @return
	 */
	public static Date str2Date(String date) {
		if (notEmpty(date)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				return sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return new Date();
		} else {
			return null;
		}
	}

	/**
	 * 按照参数format的格式，日期转字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String date2Str(Date date, String format) {
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		} else {
			return "";
		}
	}

	/**
	 * 把时间根据时、分、秒转换为时间段
	 * @param StrDate
	 */
	public static String getTimes(String StrDate) {
		String resultTimes = "";

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now;

		try {
			now = new Date();
			Date date = df.parse(StrDate);
			long times = now.getTime() - date.getTime();
			long day = times / (24 * 60 * 60 * 1000);
			long hour = (times / (60 * 60 * 1000) - day * 24);
			long min = ((times / (60 * 1000)) - day * 24 * 60 - hour * 60);
			long sec = (times / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);

			StringBuffer sb = new StringBuffer();
			// sb.append("发表于：");
			if (hour > 0) {
				sb.append(hour + "小时前");
			} else if (min > 0) {
				sb.append(min + "分钟前");
			} else {
				sb.append(sec + "秒前");
			}

			resultTimes = sb.toString();
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return resultTimes;
	}

	/**
	 * 写txt里的单行内容
	 * @param fileP 文件路径
	 * @param content 写入的内容
	 */
	public static void writeFile(String fileP, String content) {
		String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../"; // 项目路径
		filePath = (filePath.trim() + fileP.trim()).substring(6).trim();
		if (filePath.indexOf(":") != 1) {
			filePath = File.separator + filePath;
		}
		try {
			OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(filePath), "utf-8");
			BufferedWriter writer = new BufferedWriter(write);
			writer.write(content);
			writer.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证邮箱
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	/**
	 * 验证手机号码
	 * @param mobileNumber
	 * @return
	 */
	public static boolean checkMobileNumber(String mobileNumber) {
		boolean flag = false;
		try {
			Pattern regex = Pattern.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
			Matcher matcher = regex.matcher(mobileNumber);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	/**
	 * 检测KEY是否正确
	 * @param paraname 传入参数
	 * @param FKEY 接收的 KEY
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean checkKey(String paraname, String FKEY) {
		paraname = (null == paraname) ? "" : paraname;
		return MD5.md5(paraname + DateUtil.getDays() + ",fh,").equals(FKEY);
	}

	/**
	 * 读取txt里的单行内容
	 * @param fileP 文件路径
	 */
	public static String readTxtFile(String fileP) {
		try {

			String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../"; // 项目路径
			filePath = filePath.replaceAll("file:/", "");
			filePath = filePath.replaceAll("%20", " ");
			filePath = filePath.trim() + fileP.trim();
			if (filePath.indexOf(":") != 1) {
				filePath = File.separator + filePath;
			}
			String encoding = "utf-8";
			File file = new File(filePath);
			if (file.isFile() && file.exists()) { // 判断文件是否存在
				InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding); // 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					return lineTxt;
				}
				read.close();
			} else {
				System.out.println("找不到指定的文件,查看此路径是否正确:" + filePath);
			}
		} catch (Exception e) {
			System.out.println("读取文件内容出错");
		}
		return "";
	}

	public static boolean isNumeric(String str){
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if( !isNum.matches() ){
			return false;
		}
		return true;
	}

	public static List stringToList(String str){
		String[] arrayStr=str.split(",");
		List list = java.util.Arrays.asList(arrayStr);
		return list;
	}

	public static String getCompayId(String parentIds){
		if(parentIds.contains(",")) {
			String[] strs = parentIds.split(",");
			return strs[1];
		}else{
			return "1";
		}
	}

	/**
	 * 正向选择树后，提供给优惠劵需要的真正需要的结果，去掉最后的叶子层
	 * @param ids
	 * @return
	 * 101010,10101010,10101011,10101012,10101013,10101014
	 */
	public static String getPositiveTreeResult(String ids){
		return null;
	}

	/**
	 * 根据优惠劵后台提供的ids，提供前端树所需要的所有节点
	 * @param ids
	 * @return
	 */
	public static String getRreverseTreeResult(String ids){
		return null;
	}



	public static String getParentIds(SysMenu parentMenu, Long parentId){
		StringBuffer sb=new StringBuffer();
		sb.append(parentMenu.getParentIds());
		sb.append(parentId);
		sb.append(",");
		return sb.toString();
	}

	/*public static void main(String[] args) {

		String ids="0,1,8";
		String[] strs=ids.split(",");
		System.out.println(strs[1]);

	}*/


	/**
	 * 添加Flash消息
	 */
	public static void addMessage(RedirectAttributes redirectAttributes, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		redirectAttributes.addFlashAttribute("message", sb.toString());
	}


	public static void initPageNumAndPageSize(String pageSize,String pageNum){
		if(StringUtils.isBlank(pageSize)){
			pageSize="10";
		}
		if(StringUtils.isBlank(pageNum)){
			pageNum="1";
		}
	}

	public static Double getProductAndGPId(Long productId,Long gpId){
		StringBuffer sb=new StringBuffer();
		StringBuffer sbs=new StringBuffer();
		sb.append(productId);
		sb.append("_");
		sb.append(gpId);
		System.out.println(sb.toString());
		String[] strs=sb.toString().split("_");
		for(String s:strs){
			sbs.append(s);
		}
		return Double.parseDouble(sbs.toString());
	}

	public static  void main(String[] args){
		//Tools.getProductAndGPId();

	}


	public static String getIp(HttpServletRequest request) {
		           String ip = request.getHeader("X-Forwarded-For");
		           if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
			              //多次反向代理后会有多个ip值，第一个ip才是真实ip
			               int index = ip.indexOf(",");
			               if(index != -1){
				                   return ip.substring(0,index);
				               }else{
				                   return ip;
				               }
			            }
		           ip = request.getHeader("X-Real-IP");
		           if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
			                return ip;
			            }
		            return request.getRemoteAddr();
		       }


		       public static String getParameters(HttpServletRequest request){
				   Enumeration enu=request.getParameterNames();
				   StringBuffer sb=new StringBuffer();
				   while(enu.hasMoreElements()){
					   String paraName=(String)enu.nextElement();
					   sb.append(paraName+"="+request.getParameter(paraName));
					   sb.append("&");
					   //System.out.println(paraName+"="+request.getParameter(paraName));
				   }
				   return sb.toString();
			   }


	public static List<Long> stringToLongList(String str){
		String[] arrayStr=str.split(",");
		List<Long> list = Lists.newArrayList();
		for(String a:arrayStr){
			list.add(Long.parseLong(a));
		}
		return list;
	}

	public static List<Integer> stringToIntegerList(String str){
		String[] arrayStr=str.split(",");
		List<Integer> list = Lists.newArrayList();
		for(String a:arrayStr){
			list.add(Integer.parseInt(a));
		}
		return list;
	}

	public static List<JsonActivityProductDTO> getJsonList(String searchproductIds){
		if (searchproductIds == null || "".equals(searchproductIds.trim())) {
			return null;
		}
		List<JsonActivityProductDTO> dtos= Lists.newArrayList();
		//String searchproductIds = "903-100000112-无籽西瓜,903-100000113-0105测试称重商品促销1,904-100000112-无籽西瓜,904-100000113-0105测试称重商品促销1";
		String[] productIdAndStoreIds=searchproductIds.split(",");
		for(int i=0;i<productIdAndStoreIds.length;i++){
			//System.out.println(s);
			String[] storeAndProductId=productIdAndStoreIds[i].split("-");
			JsonActivityProductDTO jd=new JsonActivityProductDTO();
			for(int j=0;j<storeAndProductId.length;j++){
				if(j==0){
					jd.setStoreId(storeAndProductId[j]);
					jd.setProductId(storeAndProductId[j+1]);
					jd.setProductName(storeAndProductId[j+2]);
					dtos.add(jd);
				}
			}
		}
		System.out.println(dtos.toString());
		return dtos;
	}

}
