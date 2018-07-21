package com.ueater.backstage.common.util;

public class PagingUtil {

    /**
     * 获取分页 页码
     * @param pages
     * @return
     */
    public static int[] getPageNo(int pages){



        if( pages < 1 ){
            return null;
        }
        int[] pageNo=new int[pages];
        for( int i = 0; i < pageNo.length; i++ ){
            pageNo[i] = i*1;
        }
        return pageNo;
    }

}
