package com.SQLite;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.RetrieveAll;
import com.model.RetrieveImages;

public class Retrieves {
	
	
	public static List<RetrieveImages> RetrieveImages(String namePackage) {
		
		
		List<RetrieveImages> images = new ArrayList<RetrieveImages>();
		
		Connection conn = null;
		Connect connect = new Connect();
		
		String sql = "select PI.urlPicture, "
				+ "PI.datePicture, "
				+ "BU.zipCode, "
				+ "BU.lat_Building, "
				+ "BU.long_Building, "
				+ "PA.namePackage from Pictures as PI "
				+ "join CleanHouses as CL on CL.codCleanHouse == PI.codCleanHouse "
				+ "join Building as BU on BU.id_Building == CL.id_Building "
				+ "join Packages as PA on PA.codPackage == CL.codPackage\r\n"
				+ "where PI.codCleanHouse in "
				+ "(select codCleanHouse from CleanHouses where codPackage in "
				+ "(select codPackage from Packages where namePackage == '"+namePackage+"'))";
		
		
		try{
			
			conn = connect.connection();
			
			Statement statement = conn.createStatement();
			
			ResultSet rs = statement.executeQuery(sql);
			
			while ( rs.next() ) {
				
				RetrieveImages RI = new RetrieveImages();
				
				RI.setNamePackage(rs.getString("namePackage"));
				RI.setUrlPicture(rs.getString("urlPicture"));
				RI.setDatePicture(rs.getString("datePicture"));
				RI.setLat_Building(rs.getString("lat_Building"));
				RI.setLong_Building(rs.getString("long_Building"));
				RI.setZipCode(rs.getInt("zipCode"));
				
				images.add(RI);				
			}
			
			connect.disconnection(conn);
			 
			return images;
			
        } catch (SQLException e) {
        	
            System.out.println(e.getMessage());
            
            connect.disconnection(conn);
            
            return images;
        
        }
		
	}
	
	public static List<RetrieveAll> RetrieveAll(String date)  {
		
		List<RetrieveAll> all = new ArrayList<RetrieveAll>();
		
		Connection conn = null;
		Connect connect = new Connect();
	
		String sql = "SELECT distinct R.nameRequester, "
				+ "B.zipCode,"
				+ "B.lat_Building, "
				+ "B.long_Building,"
				+ "CS.lat_Service, "
				+ "CS.long_Service, "
				+ "CS.dateFinished, "
				+ "CS.dateStarted,"
				+ "P.namePackage, "
				+ "Pi.urlPicture  "
				+ "FROM CleanHouse_Services as CS\r\n"
				+ "LEFT JOIN Packages as P ON P.codPackage == CS.codCleanHouse\r\n"
				+ "LEFT JOIN Pictures as Pi ON Pi.codCleanHouses == CS.codCleanHouse\r\n"
				+ "LEFT JOIN Building as B ON CS.idBuilding == B.id_Building\r\n"
				+ "LEFT JOIN Requesters as R ON R.cpf == CS.cpf_Requester\r\n"
				+ "WHERE dateStarted == '" + date + "' or dateFinished == '" + date + "';";
		
		
		try{
			
			conn = connect.connection(); 
			
			Statement statement = conn.createStatement();
			
			ResultSet rs = statement.executeQuery(sql);
			
			while ( rs.next() ) {
				
				RetrieveAll rall = new RetrieveAll();
				
				rall.setNameRequester(rs.getString("nameRequester"));
				rall.setLat_Building(rs.getString("lat_Building"));
				rall.setLong_Building(rs.getString("long_Building"));
				rall.setLat_Service(rs.getString("lat_Service"));
				rall.setLong_Service(rs.getString("long_Service"));
				rall.setDateFinished(rs.getString("dateFinished"));
				rall.setDateStarted(rs.getString("dateStarted"));
				rall.setNamePackage(rs.getString("namePackage"));
				rall.setUrlPicture(rs.getString("urlPicture"));
				rall.setZipCode(rs.getInt("zipCode"));

				all.add(rall);
			}
			
			connect.disconnection(conn);
			
			return all;
			
        } catch (SQLException e) {
        	
            System.out.println(e.getMessage());
            
            connect.disconnection(conn);
            
            return all;
        
        }
		
	}

}
