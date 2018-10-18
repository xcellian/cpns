package wpk.com.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.sym.mnu.mcm.service.MenuCreatVO;
import egovframework.com.sym.mnu.mcm.service.MenuSiteMapVO;
import wpk.com.service.MenuVO;
import wpk.com.service.ParkMasterVO;

import org.springframework.stereotype.Repository;

@Repository("wpkComUtilDAO")
public class WpkComUtilDAO extends EgovComAbstractDAO{
	
	/**
	 * 주차장 목록을 조회
	 * @param parkVO
	 * @return List<ParkMasterVO>
	 * @exception Exception
	 */
	public List<ParkMasterVO> selectParkList(ParkMasterVO parkVO) throws Exception{
		return selectList("wpkComUtilDAO.selectParkList", parkVO);
	}
	
	/**
	 * 주차장 조회
	 * @param parkVO
	 * @return ParkMasterVO
	 * @exception Exception
	 */
	public ParkMasterVO selectPark(ParkMasterVO parkVO) throws Exception{
		return selectOne("wpkComUtilDAO.selectPark", parkVO);
	}
	
	/**
	 * 메뉴 조회
	 * @param authCd
	 * @return List<MenuVO>
	 * @exception Exception
	 */
	public List<MenuVO> selectMenuList(String authCd) throws Exception{
		return selectList("wpkComUtilDAO.selectMenuList", authCd);
	}
	
	
//	/**
//	 * ID 존재여부를 조회
//	 * @param vo MenuManageVO
//	 * @return int
//	 * @exception Exception
//	 */
//	public int selectUsrByPk(ComDefaultVO vo) throws Exception{
//		return (Integer)selectOne("menuManageDAO.selectUsrByPk", vo);
//	}
//
//	/**
//	 * ID에 대한 권한코드를 조회
//	 * @param vo MenuCreatVO
//	 * @return int
//	 * @exception Exception
//	 */
//	public MenuCreatVO selectAuthorByUsr(ComDefaultVO vo) throws Exception{
//		return (MenuCreatVO)selectOne("menuManageDAO.selectAuthorByUsr", vo);
//	}
//
//	/**
//	 * 메뉴생성관리 내역을 조회
//	 * @param vo ComDefaultVO
//	 * @return List
//	 * @exception Exception
//	 */
//	public List<?> selectMenuCreatManagList(ComDefaultVO vo) throws Exception{
//		return selectList("menuManageDAO.selectMenuCreatManageList_D", vo);
//	}
//
//	/**
//	 * 메뉴생성관리 총건수를 조회한다.
//	 * @param vo ComDefaultVO
//	 * @return int
//	 * @exception Exception
//	 */
//    public int selectMenuCreatManagTotCnt(ComDefaultVO vo) {
//        return (Integer)selectOne("menuManageDAO.selectMenuCreatManageTotCnt_S", vo);
//    }
//
//    /*********** 메뉴 생성 관리 ***************/
//	/**
//	 * 메뉴생성 내역을 조회
//	 * @param vo MenuCreatVO
//	 * @return List
//	 * @exception Exception
//	 */
//	public List<?> selectMenuCreatList(MenuCreatVO vo) throws Exception{
//		return selectList("menuManageDAO.selectMenuCreatList_D", vo);
//	}
//
//	/**
//	 * 메뉴생성내역 등록
//	 * @param vo MenuCreatVO
//	 * @exception Exception
//	 */
//	public void insertMenuCreat(MenuCreatVO vo){
//		insert("menuManageDAO.insertMenuCreat_S", vo);
//	}
//
//	/**
//	 * 메뉴생성 사이트맵 내용 조회
//	 * @param vo MenuSiteMapVO
//	 * @return List
//	 * @exception Exception
//	 */
//	public List<?> selectMenuCreatSiteMapList(MenuSiteMapVO vo) throws Exception{
//		return selectList("menuManageDAO.selectMenuCreatSiteMapList_D", vo);
//	}
//
//
//
//	/**
//	 * 사이트맵 등록
//	 * @param vo MenuSiteMapVO
//	 * @exception Exception
//	 */
//	public void creatSiteMap(MenuSiteMapVO vo){
//		insert("menuManageDAO.insertSiteMap_S", vo);
//	}
//
//	/**
//	 * 사용자 권한별 사이트맵 내용 조회
//	 * @param vo MenuSiteMapVO
//	 * @return List
//	 * @exception Exception
//	 */
//	public List<?> selectSiteMapByUser(MenuSiteMapVO vo) throws Exception{
//		return selectList("menuManageDAO.selectSiteMapByUser", vo);
//	}
//
//	/**
//	 * 메뉴생성내역 존재여부 조회한다.
//	 * @param vo MenuCreatVO
//	 * @return int
//	 * @exception Exception
//	 */
//    public int selectMenuCreatCnt(MenuCreatVO vo) {
//        return (Integer)selectOne("menuManageDAO.selectMenuCreatCnt_S", vo);
//    }
//
//
//	/**
//	 * 메뉴생성내역 수정
//	 * @param vo MenuCreatVO
//	 * @exception Exception
//	 */
//	public void updateMenuCreat(MenuCreatVO vo){
//		update("menuManageDAO.updateMenuCreat_S", vo);
//	}
//
//
//	/**
//	 * 메뉴생성내역 삭제
//	 * @param vo MenuCreatVO
//	 * @exception Exception
//	 */
//	public void deleteMenuCreat(MenuCreatVO vo){
//		delete("menuManageDAO.deleteMenuCreat_S", vo);
//	}
//
//	/**
//	 * 사이트맵 존재여부 조회한다.
//	 * @param vo MenuSiteMapVO
//	 * @return int
//	 * @exception Exception
//	 */
//    public int selectSiteMapCnt(MenuSiteMapVO vo) {
//        return (Integer)selectOne("menuManageDAO.selectSiteMapCnt_S", vo);
//    }

}
