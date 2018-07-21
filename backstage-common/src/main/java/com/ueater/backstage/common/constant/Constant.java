package com.ueater.backstage.common.constant;

import com.google.common.collect.Maps;
import com.ueater.tool.zkConfigGroups.IZKConfigGroups;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.Map;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 四月 12 2017 下午2:55
 */
@Component
public class Constant {

    private static Map<String, IZKConfigGroups> map = Maps.newHashMapWithExpectedSize(1);

    private static final String HOST = "HOST";

    private Constant constant;

    @Resource(name = "ZKConfigGroups")
    private IZKConfigGroups zKConfigGroups;

    @PostConstruct
    public void init() {
        constant = this;
        constant.map.put(HOST, zKConfigGroups);
    }



    public static class Member {
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("member", "outer");
        }
    }
    
    public static class Message {
        public static String FANOUT = "fanout";
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("message", "outer");
        }
        public static Long getBatchPushTepletID() {
            return Long.valueOf(map.get(Constant.HOST).getConfigString("message.batch.push.tepletId", "config"));
        }
    }
    
    public static class Store {
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("store", "outer");
        }
    }

    public static class Activity {
        public static String getHost(){
             //return "http://172.16.30.114:8097";
//            return "http://localhost:8090";
            return map.get(Constant.HOST).getConfigString("activity", "outer");
        }
    }

    public static class Order {
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("order", "outer");
        }
    }

    public static class Coupon {
        public static String getHost(){
            return map.get(Constant.HOST).getConfigString("coupon", "outer");
        }
    }

    public static class CouponDistribution {
        public static String getHost(){
            return map.get(Constant.HOST).getConfigString("couponDistribution", "outer");
        }
    }


    public static class Payment {
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("payment", "outer");
        }
    }


    public static class ReverseOrder {
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("reverseOrder", "outer");
        }
    }

    public static class Image {
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("image", "outer");
        }
        //public static String HOST = "http://172.16.30.125:8083";
    }

    public static class Cms {
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("cms", "outer");
        }
    }

    public static class Product {
        public static String getHOST() {
            return map.get(Constant.HOST).getConfigString("product", "outer");
//            return "http://172.16.30.114:8092";
        }
    }

    public static class Inventory {
        public static String getHost() {
            return map.get(Constant.HOST).getConfigString("inventory", "outer");
        }
    }

    public static class Price {
        public static String getHost() {
            return map.get(Constant.HOST).getConfigString("price", "outer");
        }
    }
}
