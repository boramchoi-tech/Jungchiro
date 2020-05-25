package com.jungchiro.poli.bill.model.dao;

import java.util.List;

import com.jungchiro.poli.bill.model.dto.BillDto;
import com.jungchiro.poli.board.model.dto.PagingDto;

public interface BillDao {
	
	String NAMESPACE = "billDto.";

	public List<BillDto> billList(PagingDto page);
	public int listCount();

}
