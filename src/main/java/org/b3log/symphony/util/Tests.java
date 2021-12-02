/*
 * Rhythm - A modern community (forum/BBS/SNS/blog) platform written in Java.
 * Modified version from Symphony, Thanks Symphony :)
 * Copyright (C) 2012-present, b3log.org
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
package org.b3log.symphony.util;

import org.json.JSONObject;

import java.util.*;

public class Tests {
    public static void main(String[] args) throws InterruptedException {
        Map<String, JSONObject> MD_CACHE = Collections.synchronizedMap(new LinkedHashMap<String, JSONObject>() {
            @Override
            protected boolean removeEldestEntry(Map.Entry eldest) {
                return size() > 5;
            }
        });
        //MD_CACHE = new ConcurrentHashMap<>();
        for (int i = 0; i < 10000; i++) {
            int a = i;
            new Thread(() -> {
                try {
                    Thread.sleep(new Random().nextInt(100) + 1);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("put " + a);
                MD_CACHE.put(a + "", new JSONObject().put("hi", "hello"));
            }).start();
        }
        Thread.sleep(2000);
        System.out.println(MD_CACHE.size());
        for (Map.Entry<String, JSONObject> i : MD_CACHE.entrySet()) {
            System.out.println(i.getKey() + " " + i.getValue());
        }
        Thread.sleep(2000);
        MD_CACHE.put("new", new JSONObject().put("hi", "hello"));
        System.out.println(MD_CACHE.size());
        for (Map.Entry<String, JSONObject> i : MD_CACHE.entrySet()) {
            System.out.println(i.getKey() + " " + i.getValue());
        }
    }
}
