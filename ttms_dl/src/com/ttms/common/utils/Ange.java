package com.ttms.common.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

//public class AnGe {
//
//	public static void main(String[] args) {
//
//		Danraw d = new Danraw();
//		d.Danchou();
//		d.Shichou();
//	}
//}
public class Ange {
	public List<String> Danchou() {
		List<String> herolist = new ArrayList<>();
		int randomNumber = 0;
		String[] arrS2 = { "蔡文姬", "司马懿", "郭嘉", "诸葛亮", "关羽", "周瑜", "小乔", "貂蝉", "吕布", "孙策", "张辽", "徐晃", "典韦", "荀彧", "曹植",
				"夏侯淳", "姜维", "黄月英", "黄忠", "魏延", "马超", "张飞", "赵云", "吕蒙", "甘宁", "陆逊", "孙尚香", "太史慈", "大乔", "鲁肃", "张角",
				"公孙瓒", "贾诩", "华佗", "文丑", "颜良", "华雄", "董卓" };
		int randomNumberS2 = new Random().nextInt(38);
		for (int j = 0; j < 1; j++) {
			while (true) {
				randomNumber = new Random().nextInt(100);
				if (randomNumber <= 49) {
					herolist.add("四星武将");
					break;
				} else if (randomNumber <= 79 && randomNumber >= 50) {
					herolist.add("五星碎片");
					break;
				} else {
					herolist.add(arrS2[randomNumberS2]);
					break;
				}
			}
		}
		System.out.println(herolist);
		return herolist;
	}

	public List<String> Shichou() {
		List<String> tenherolist = new ArrayList<>();
		int randomNumber = 0;
		String[] arrS2 = { "蔡文姬", "司马懿", "郭嘉", "诸葛亮", "关羽", "周瑜", "小乔", "貂蝉", "吕布", "孙策", "张辽", "徐晃", "典韦", "荀彧", "曹植",
				"夏侯淳", "姜维", "黄月英", "黄忠", "魏延", "马超", "张飞", "赵云", "吕蒙", "甘宁", "陆逊", "孙尚香", "太史慈", "大乔", "鲁肃", "张角",
				"公孙瓒", "贾诩", "华佗", "文丑", "颜良", "华雄", "董卓" };

		for (int j = 1; j <= 10; j++) {
			while (randomNumber < 100) {
				randomNumber = new Random().nextInt(100);

				if (randomNumber <= 49) {
					tenherolist.add("四星武将");
					break;
				} else if (randomNumber <= 79 && randomNumber >= 50) {
					tenherolist.add("五星碎片");
					break;
				} else {
					int randomNumberS2 = new Random().nextInt(38);
					tenherolist.add(arrS2[randomNumberS2]);
					break;
				}
			}
		}
		System.out.println(tenherolist);
		return tenherolist;
	}

}
