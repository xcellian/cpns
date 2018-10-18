package wpk.com.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 사용자정보 VO클래스로서일반회원, 기업회원, 업무사용자의  비지니스로직 처리시 기타조건성 항을 구성한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *
 * </pre>
 */
public class ComDefaultVO implements Serializable {
	
	private static final long serialVersionUID = 4829684178121022508L;
	
	/** 그리드 초기화 여부 */
	private boolean initialized = false;
	
	/** 주차장 */
	private String parkCd = "";
	
	/** 검색조건 */
	private List<Map<String, Object>> searchItem;
	
	/** 검색Keyword */
	private String keyword = "";
	
	/** 시작일 */
	private String startDt = "";
	
	/** 종료일 */
	private String endDt = "";
	
	/** 기간 */
	private String period = "";
	
	/** 쿠폰/할인키 구분 */
	private String cpnType = "";
	
	/** 입주사 일련번호 */
	private String custSeq = "";
	
	/** 사용유무 */
	private String useYn = "";
	
	/** 검색사용여부 */
	private String searchUseYn = "1";
	
	/** sort order */
	private List<Map<String, Object>> order = null;
	
	/** draw - datatables's param */
	private int draw;
	
	/** 현재페이지 */
	private int page = 0;
	
	/** 시작인덱스 */
	private int start = 0;
	
	/** 페이지사이즈 */
	private int length = 10;
	
	/** 전체레코드수 */
	private int recordsTotal = 0;
	
	/** 필터링된레코드수 */
	private int recordsFiltered = 0;
	
	/**
	 * @return the initialized
	 */
	public boolean isInitialized() {
		return initialized;
	}
	
	/**
	 * @param initialized the initialized to set
	 */
	public void setInitialized(boolean initialized) {
		this.initialized = initialized;
	}
	
	/**
	 * @return the parkCd
	 */
	public String getParkCd() {
		return parkCd;
	}
	
	/**
	 * @param parkCd the parkCd to set
	 */
	public void setParkCd(String parkCd) {
		this.parkCd = parkCd;
	}
	
	/**
	 * @return the searchItem
	 */
	public List<Map<String, Object>> getSearchItem() {
		return searchItem;
	}
	
	/**
	 * @param searchItem the searchItem to set
	 */
	public void setSearchItem(List<Map<String, Object>> searchItem) {
		this.searchItem = searchItem;
	}
	
	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}
	
	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	/**
	 * @return the startDt
	 */
	public String getStartDt() {
		return startDt;
	}
	
	/**
	 * @param startDt the startDt to set
	 */
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	
	/**
	 * @return the endDt
	 */
	public String getEndDt() {
		return endDt;
	}
	
	/**
	 * @param endDt the endDt to set
	 */
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	
	/**
	 * @return the period
	 */
	public String getPeriod() {
		return period;
	}
	
	/**
	 * @param period the period to set
	 */
	public void setPeriod(String period) {
		this.period = period;
	}
	
	/**
	 * @return the cpnType
	 */
	public String getCpnType() {
		return cpnType;
	}
	
	/**
	 * @param cpnType the cpnType to set
	 */
	public void setCpnType(String cpnType) {
		this.cpnType = cpnType;
	}
	
	/**
	 * @return the custSeq
	 */
	public String getCustSeq() {
		return custSeq;
	}
	
	/**
	 * @param custSeq the custSeq to set
	 */
	public void setCustSeq(String custSeq) {
		this.custSeq = custSeq;
	}
	
	/**
	 * @return the useYn
	 */
	public String getUseYn() {
		return useYn;
	}
	
	/**
	 * @param useYn the useYn to set
	 */
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	/**
	 * @return the searchUseYn
	 */
	public String getSearchUseYn() {
		return searchUseYn;
	}
	
	/**
	 * @param searchUseYn the searchUseYn to set
	 */
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}
	
	/**
	 * @return the order
	 */
	public List<Map<String, Object>> getOrder() {
		return order;
	}
	
	/**
	 * @param order the order to set
	 */
	public void setOrder(List<Map<String, Object>> order) {
		this.order = order;
	}
	
	/**
	 * @return the draw
	 */
	public int getDraw() {
		return draw;
	}
	
	/**
	 * @param draw the draw to set
	 */
	public void setDraw(int draw) {
		this.draw = draw;
	}
	
	/**
	 * @return the page
	 */
	public int getPage() {
		return page;
	}
	
	/**
	 * @param page the page to set
	 */
	public void setPage(int page) {
		this.page = page;
	}
	
	/**
	 * @return the start
	 */
	public int getStart() {
		return start;
	}
	
	/**
	 * @param start the start to set
	 */
	public void setStart(int start) {
		this.start = start;
	}
	
	/**
	 * @return the length
	 */
	public int getLength() {
		return length;
	}
	
	/**
	 * @param length the length to set
	 */
	public void setLength(int length) {
		this.length = length;
	}
	
	/**
	 * @return the recordsTotal
	 */
	public int getRecordsTotal() {
		return recordsTotal;
	}
	
	/**
	 * @param recordsTotal the recordsTotal to set
	 */
	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}
	
	/**
	 * @return the recordsFiltered
	 */
	public int getRecordsFiltered() {
		return recordsFiltered;
	}
	
	/**
	 * @param recordsFiltered the recordsFiltered to set
	 */
	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
	
}
