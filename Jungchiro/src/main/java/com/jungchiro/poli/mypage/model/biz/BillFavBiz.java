package com.jungchiro.poli.mypage.model.biz;

import java.util.List;

import com.jungchiro.poli.mypage.model.dto.BillFavDto;

public interface BillFavBiz {
	
	public List<BillFavDto> billFavList(int member_seq);
	public List<BillFavDto> billFavUpdateList(int member_seq);
	public List<BillFavDto> billFavPartialList(int member_seq, int start, int end);
	public int checkBillFav(String bill_id, int member_seq);
	public int getTotalBillFav(int member_seq);
	public int billFavInsert(BillFavDto dto);
	public int cancleBillLike(String bill_id, int member_seq);
	public int billFavDelete(String[] bill_id, int member_seq);

}
