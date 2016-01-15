package com.medical.manager.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;

public class StringUtil {
	
	/**
	 * 生成随机纯数字
	 * @param length
	 * @return
	 */
	public static String genRandNum(int length){
		String[] nums = {"1","2","3","4","5","6","7","8","9","0"};
		String str = "";
		Random rand = new Random();
		for(int i=0;i<length;i++){
			str+=nums[rand.nextInt(nums.length)];
		}
		return str;
	}
	
	/**
	 * MD5加密
	 *<p><strong>Description:</strong> encryptionMD5 </p>
	 * @param inputText
	 * @return
	 * @update 日期: 2014-12-30
	 */
	public static String encryptionMD5(String inputText) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(inputText.getBytes());
            byte b[] = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            return buf.toString().toUpperCase();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            
            return null;
        }

    }
	
	public static String paramMapsToString(Map<String, String> paramMap){
		StringBuffer sb = new StringBuffer();
		Set es = paramMap.entrySet();
		Iterator it = es.iterator();
		while(it.hasNext()) {
			Map.Entry entry = (Map.Entry)it.next();
			String k = (String)entry.getKey();
			Object v = entry.getValue();
			if(null != v && !"".equals(v) ) {
				sb.append(k + "=" + v + "&");
			}
		}
		sb.append("rand="+System.currentTimeMillis());
		 
		return sb.toString();
	}
	
	/**
	 * @description genOrderNumber 生成订单号
	 * @return String
	 * @exception 
	 * @author Jason
	 * @since  1.0.0
	 */
	public static String genOrderNumber(){
	    String no = DateUtil.getTime() + StringUtil.genRandNum(3);
	    return no;
	}
	
	public static void main(String[] args) {
		for(int i=0;i<10000;i++){
			System.out.println(StringUtil.genRandNum(6));
		}
		
	}

}
