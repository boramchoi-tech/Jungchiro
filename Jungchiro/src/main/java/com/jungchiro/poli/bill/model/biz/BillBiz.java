package com.jungchiro.poli.bill.model.biz;

import java.util.List;

import com.jungchiro.poli.bill.model.dto.BillDto;
import com.jungchiro.poli.board.model.dto.PagingDto;

public interface BillBiz {
	
	public List<BillDto> billList(PagingDto page);
	public int listCount();

}
