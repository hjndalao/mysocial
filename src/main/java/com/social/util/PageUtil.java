package com.social.util;

import java.util.HashMap;
import java.util.Map;

public class PageUtil {
    //分页方法
    public static Map<String, Integer> page(Integer pageNum, Integer page, Integer count) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        //当前页
        if (page == null) page = 1;
        //每页显示条数
        if (pageNum == null) pageNum = 5;
        //剩余页数
        int remaining_pages = 0;
        //处理显示多少页
        if (count % pageNum == 0) {
            remaining_pages = count / pageNum;
        } else {
            remaining_pages = count / pageNum + 1;
        }
        map.put("page", page);
        map.put("pageNum", pageNum);
        map.put("remaining_pages", remaining_pages);
        map.put("count", count);
        return map;
    }
}
