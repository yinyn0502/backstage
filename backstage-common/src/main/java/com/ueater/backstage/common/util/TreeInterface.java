package com.ueater.backstage.common.util;

/**
 * Created by Administrator on 2017/8/21.
 */
import java.io.Serializable;
import java.util.List;

/**
 *
 * 描述：树形结构服务类
 * 作者： xfz
 * 时间：2016年7月2日
 * 版本号：1.0
 */
public interface TreeInterface<T extends BaseTreeObj<T,ID>, ID extends Serializable>{
    /**
     * 获得指定节点下所有归档
     * @param list
     * @param parentId
     * @return
     * @author xfz
     * 上午1:09:49
     */
    public List<T> getChildTreeObjects(List<T> list, ID parentId);
    /**
     * 递归列表
     * @param list
     * @param t
     * @author xfz
     * 上午1:11:57
     */
    public void recursionFn(List<T> list, T t);
    /**
     * 获得指定节点下的所有子节点
     * @param list
     * @param t
     * @return
     * @author xfz
     * 上午1:12:55
     */
    public List<T> getChildList(List<T> list, T t);
    /**
     * 判断是否还有下一个子节点
     * @param list
     * @param t
     * @return
     * @author xfz
     * 上午1:13:43
     */
    public boolean hasChild(List<T> list, T t);
}



