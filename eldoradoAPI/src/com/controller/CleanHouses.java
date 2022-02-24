package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model.RetrieveImages;
import com.SQLite.Retrieves;
import com.model.RetrieveAll;

@RestController
public class CleanHouses {

		@GetMapping(value="/RetrieveImages")
		public List<RetrieveImages> RetrieveImages(@RequestParam String namePackage) {
			
			List<RetrieveImages> images = new ArrayList<RetrieveImages>();
			
			images = Retrieves.RetrieveImages(namePackage);
			
			return images;
			
		}
		
		@GetMapping(value="/RetrieveAll")
		public List<RetrieveAll> RetrieveAll(@RequestParam String date) {
			
			List<RetrieveAll> all = new ArrayList<RetrieveAll>();
			
			all = Retrieves.RetrieveAll(date);
			
			return all;
			
		}
}
