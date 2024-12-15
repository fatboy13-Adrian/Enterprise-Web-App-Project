package myjsp;

public class DiscountBean
{
	public String giftName;
	public int    discount;
	
	public DiscountBean(){}
	
	public String getGiftName()
	{
		return giftName;
	}
	
	public int getDiscount()
	{
		return discount;
	}
	
	public void setGiftName(String x)
	{
		giftName = x;
	}
	
	public void setDiscount(int x)
	{
		discount = x;
	}
}