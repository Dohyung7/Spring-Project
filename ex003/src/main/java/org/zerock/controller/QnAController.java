package org.zerock.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/QnA/*")
@Controller
public class QnAController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	



	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value = "/chatbot")
	public void chatbot(Locale locale, Model model) {
		logger.info("Welcome chatbot!");
	
	}
}
