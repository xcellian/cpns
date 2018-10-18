package wpk.com.service;

public class MenuVO extends CommonVO{
	
	/** 메뉴명 */
	private String menuNm = "";
	
	/** 메뉴 URL */
	private String menuAction = "";
	
	/** 메뉴 번호 */
	private String menuNo = "";
	
	/** 상위 메뉴 번호 */
	private String upperMenuNo = "";
	
	/** 메뉴 순서 */
	private String menuOrder = "";
	
	/** 메뉴 설명 */
	private String menuDescr = "";
	
	/** 메뉴 아이콘 */
	private String relateIcon = "";
	
	/** 사용유무 */
	private String useYn = "";
	
	/**
	 * @return the menuNm
	 */
	public String getMenuNm() {
		return menuNm;
	}
	
	/**
	 * @param menuNm the menuNm to set
	 */
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	
	/**
	 * @return the menuAction
	 */
	public String getMenuAction() {
		return menuAction;
	}
	
	/**
	 * @param menuAction the menuAction to set
	 */
	public void setMenuAction(String menuAction) {
		this.menuAction = menuAction;
	}
	
	/**
	 * @return the menuNo
	 */
	public String getMenuNo() {
		return menuNo;
	}
	
	/**
	 * @param menuNo the menuNo to set
	 */
	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}
	
	/**
	 * @return the upperMenuNo
	 */
	public String getUpperMenuNo() {
		return upperMenuNo;
	}
	
	/**
	 * @param upperMenuNo the upperMenuNo to set
	 */
	public void setUpperMenuNo(String upperMenuNo) {
		this.upperMenuNo = upperMenuNo;
	}
	
	/**
	 * @return the menuOrder
	 */
	public String getMenuOrder() {
		return menuOrder;
	}
	
	/**
	 * @param menuOrder the menuOrder to set
	 */
	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}
	
	/**
	 * @return the menuDescr
	 */
	public String getMenuDescr() {
		return menuDescr;
	}
	
	/**
	 * @param menuDescr the menuDescr to set
	 */
	public void setMenuDescr(String menuDescr) {
		this.menuDescr = menuDescr;
	}
	
	/**
	 * @return the relateIcon
	 */
	public String getRelateIcon() {
		return relateIcon;
	}
	
	/**
	 * @param relateIcon the relateIcon to set
	 */
	public void setRelateIcon(String relateIcon) {
		this.relateIcon = relateIcon;
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
}