package myjsp;

public class LoginBean
{
	public String UserName;
	public String Password;

	public LoginBean(){}
	
	public String getUserName()
	{
		return UserName;
	}
	
	public String getPassword()
	{
		return Password;
	}
	
	public void setUserName(String x)
	{
		UserName = x;
	}
	
	public void setPassword(String x)
	{
		Password = x;
	}
}