package myjsp;

public class AdminBean
{
	public String UserName;
	public String Password;
	public String UserGroup;

	public AdminBean()
	{
	}

	public String getUserName()
	{
		return UserName;
	}

	public String getPassword()
	{
		return Password;
	}

	public String getUserGroup()
	{
		return UserGroup;
	}

	public void setUserName(String id)
	{
		UserName = id;
	}

	public void setPassword(String pwd)
	{
		Password = pwd;
	}

	public void setUserGroup(String ug)
	{
		UserGroup = ug;
	}
}

