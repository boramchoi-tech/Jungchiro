package com.jungchiro.poli.board.model;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
	public static void main(String[] args) throws IOException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.assembly.go.kr/openapi/service/BillInfoService/getBillInfoList?"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=lh6rUx6cvdTbqSo03%2FgNes1tL3ATBTihMifKxirOrQ3RjBnG0LhSDYy52JY0rYyi%2BrrxfdgU6JQW94IVvLo8PQ%3D%3D"); /* Service Key */
		urlBuilder
				.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("mem_name_check", "UTF-8") + "="
				+ URLEncoder.encode("G01", "UTF-8")); /* 발의자 검색구분 */
		urlBuilder.append(
				"&" + URLEncoder.encode("mem_name", "UTF-8") + "=" + URLEncoder.encode("김영주", "UTF-8")); /* 국회의원 성명 */
		urlBuilder
				.append("&" + URLEncoder.encode("hj_nm", "UTF-8") + "=" + URLEncoder.encode("金榮珠", "UTF-8")); /* 한자성명 */
		urlBuilder.append(
				"&" + URLEncoder.encode("ord", "UTF-8") + "=" + URLEncoder.encode("A01", "UTF-8")); /* 제안대수로 검색 */
		urlBuilder.append(
				"&" + URLEncoder.encode("start_ord", "UTF-8") + "=" + URLEncoder.encode("19", "UTF-8")); /* 시작 대수 */
		urlBuilder.append(
				"&" + URLEncoder.encode("end_ord", "UTF-8") + "=" + URLEncoder.encode("19", "UTF-8")); /* 마지막 대수 */
		urlBuilder.append("&" + URLEncoder.encode("process_num", "UTF-8") + "="
				+ URLEncoder.encode("-", "UTF-8")); /* 본회의 처리 회기 검색 */
		urlBuilder.append("&" + URLEncoder.encode("start_process_num", "UTF-8") + "="
				+ URLEncoder.encode("-", "UTF-8")); /* 시작 본회의 처리회기 */
		urlBuilder.append("&" + URLEncoder.encode("end_process_num", "UTF-8") + "="
				+ URLEncoder.encode("-", "UTF-8")); /* 마지막본회의처리회기 */
		urlBuilder.append(
				"&" + URLEncoder.encode("propose_num", "UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /* 제안회기구분 */
		urlBuilder.append("&" + URLEncoder.encode("start_propose_num", "UTF-8") + "="
				+ URLEncoder.encode("-", "UTF-8")); /* 시작제안회기 */
		urlBuilder.append("&" + URLEncoder.encode("end_propose_num", "UTF-8") + "="
				+ URLEncoder.encode("-", "UTF-8")); /* 마지막제안회기 */
		urlBuilder.append("&" + URLEncoder.encode("start_propose_date", "UTF-8") + "="
				+ URLEncoder.encode("2013-01-01", "UTF-8")); /* 시작제안일자 */
		urlBuilder.append("&" + URLEncoder.encode("end_propose_date", "UTF-8") + "="
				+ URLEncoder.encode("2015-01-01", "UTF-8")); /* 마지막제안일자 */
		urlBuilder.append("&" + URLEncoder.encode("start_committee_dt", "UTF-8") + "="
				+ URLEncoder.encode("2014-01-01", "UTF-8")); /* 시작회부일자 */
		urlBuilder.append("&" + URLEncoder.encode("end_committee_dt", "UTF-8") + "="
				+ URLEncoder.encode("2015-01-01", "UTF-8")); /* 마지막회부일자 */
		urlBuilder.append(
				"&" + URLEncoder.encode("bill_kind_cd", "UTF-8") + "=" + URLEncoder.encode("B04", "UTF-8")); /* 의안종류 */
		urlBuilder.append("&" + URLEncoder.encode("curr_committee", "UTF-8") + "="
				+ URLEncoder.encode("9700008", "UTF-8")); /* 소관위원회 */
		urlBuilder.append("&" + URLEncoder.encode("proposer_kind_cd", "UTF-8") + "="
				+ URLEncoder.encode("F01", "UTF-8")); /* 제안종류 */
		urlBuilder.append("&" + URLEncoder.encode("p_proc_result_cd", "UTF-8") + "="
				+ URLEncoder.encode("D01", "UTF-8")); /* 소관위처리결과 */
		urlBuilder.append("&" + URLEncoder.encode("b_proc_result_cd", "UTF-8") + "="
				+ URLEncoder.encode("E01", "UTF-8")); /* 본회의처리결과 */
		urlBuilder.append(
				"&" + URLEncoder.encode("bill_name", "UTF-8") + "=" + URLEncoder.encode("기", "UTF-8")); /* 의안명 */
		urlBuilder.append(
				"&" + URLEncoder.encode("gbn", "UTF-8") + "=" + URLEncoder.encode("dae_num_name", "UTF-8")); /* 구분 */
		urlBuilder.append("&" + URLEncoder.encode("amendmentyn", "UTF-8") + "="
				+ URLEncoder.encode("false", "UTF-8")); /* 본회의수정안 */
		urlBuilder.append(
				"&" + URLEncoder.encode("budget", "UTF-8") + "=" + URLEncoder.encode("false", "UTF-8")); /* 비용추계서유무 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
	}
}