package com.ueater.backstage.web.test;

import com.ueater.backstage.common.model.couponmanage.JsonActivityProductDTO;
import com.ueater.backstage.web.main.Application;
import lombok.extern.slf4j.Slf4j;
import org.assertj.core.util.Lists;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2018/3/16.
 */
@Slf4j
@SpringBootTest(classes = Application.class)
@WebAppConfiguration
public class Tests {

    @Test
    public void testRs() {
        String regEx = "(.*)-(.*)@(.*),(.*)-(.*)@(.*)";
        String s = "903-100000112@无籽西瓜,904-100000113@0105测试称重商品促销1";
        Pattern pat = Pattern.compile(regEx);
        Matcher mat = pat.matcher(s);
        if (mat.find()) {
            for(int i=0;i<mat.groupCount();i++){
                System.out.println(mat.group(i));
            }

        }
    }


    @Test
    public void test() {
        List<JsonActivityProductDTO> dtos= Lists.newArrayList();
        String searchproductIds = "903-100000112-无籽西瓜,903-100000113-0105测试称重商品促销1,904-100000112-无籽西瓜,904-100000113-0105测试称重商品促销1";
        String[] productIdAndStoreIds=searchproductIds.split(",");
        /*Map<String,String> map=new HashMap<String,String>();*/
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
    }

}
