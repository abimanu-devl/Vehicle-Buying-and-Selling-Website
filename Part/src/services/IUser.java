package services;

import model.user;

public interface IUser {
	public user getUserByEmail(String email);
	public void DeleteUserDetails(String id);
	public user UpdateUserDetails(String email,user u1);

}
