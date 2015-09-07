package com.smilehat.business.web.sys.certLabel;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smilehat.business.entity.CertLabel;
import com.smilehat.business.service.CertLabelService;
import com.smilehat.business.core.service.sys.upload.AttachService;
import com.smilehat.business.core.web.BaseController;
import com.smilehat.constants.Constants;
import com.smilehat.util.CoreUtils;

import java.util.*;

import com.smilehat.modules.entity.IdEntity;

 
/**
 * 
 * @author yang
 *
 */
@Controller
@RequestMapping(value =  Constants.SPT+SysCertLabelController.PATH)
public class SysCertLabelController extends BaseController {
	 
	@Autowired
	private CertLabelService certLabelService;
	@Autowired
	private AttachService attachService;
	
	public static final String PATH = "sys/certlabel";
	public static final String PATH_LIST = PATH +Constants.SPT+ "list";
	public static final String PATH_EDIT = PATH + Constants.SPT+"edit";
	public static final String PATH_VIEW = PATH + Constants.SPT+"view";
	public static final String PATH_SEARCH = PATH + Constants.SPT+"search";
	
	@RequestMapping(value = "")
	public String list(Model model, HttpServletRequest request) {

		PageRequest pageRequest = this.getPageRequest();
		Map<String, Object> searchParams = this.getSearchRequest();
	 

		Page<CertLabel> page = certLabelService.findPage(searchParams, pageRequest);
		model.addAttribute("page", page);
	
		return PATH_LIST;
	}
	
	@RequestMapping(value = "export")
	public ModelAndView exportList(HttpServletRequest request){
		Map<String, Object> searchParams = this.getSearchRequest();
		List<CertLabel> list=certLabelService.findAll(searchParams, this.getSortOrderBy(), this.getSortOrderDesc());
		return this.reportView(PATH_LIST, list, REPORT_FORMAT_XLS);
		
	}
	
	

	@RequestMapping(value = BaseController.NEW, method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("vm", new CertLabel());
		model.addAttribute("action", BaseController.CREATE);
		return PATH_EDIT;
	}

	@RequestMapping(value =  BaseController.CREATE, method = RequestMethod.POST)
	public ModelAndView create(@Valid CertLabel certLabel, @RequestParam(value = "photoAttachId", required = false) Long photoAttachId) {
		certLabel.setPhotoAttach(attachService.findUniqueBy("id", photoAttachId));
		certLabelService.save(certLabel);		 
		
		return this.ajaxDoneSuccess("创建成功");
	}

	@RequestMapping(value =  BaseController.UPDATE+"/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", certLabelService.getObjectById(id));
		model.addAttribute("action", BaseController.UPDATE);
		return PATH_EDIT;
	}
	
	
	@RequestMapping(value =  BaseController.VIEW+"/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") java.lang.Long id, Model model) {
		model.addAttribute("vm", certLabelService.getObjectById(id));
		return PATH_VIEW;
	}

	@RequestMapping(value = BaseController.UPDATE, method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("preloadModel") CertLabel certLabel, @RequestParam(value = "photoAttachId", required = false) Long photoAttachId) {
		certLabel.setPhotoAttach(attachService.findUniqueBy("id", photoAttachId));
		certLabelService.save(certLabel);		
		return this.ajaxDoneSuccess("修改成功");
	}

	@RequestMapping(value = BaseController.DELETE+"/{id}")
	public ModelAndView delete(@PathVariable("id") java.lang.Long id) {
		certLabelService.deleteById(id);		 
		return this.ajaxDoneSuccess("删除成功");
	}
	
	@RequestMapping(value = BaseController.DELETE,method = RequestMethod.POST)
	public ModelAndView deleteBatch(@RequestParam java.lang.Long[] ids) {
		certLabelService.deleteByIds(ids);		 
		return this.ajaxDoneSuccess("删除成功");
	}
	
	
	/**
	 *  高级查询界面
	 * @param id
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "search")
	public String search(HttpServletRequest request) {	 
		return PATH_SEARCH;
	}

	 
	@ModelAttribute("preloadModel")
	public CertLabel getModel(@RequestParam(value = "id", required = false) java.lang.Long id) {
		if (id != null) {
			return certLabelService.getObjectById(id);
		}
		return null;
	}
	

}
