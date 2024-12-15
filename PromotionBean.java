package myjsp;

public class PromotionBean
{
	public String giftName;
	public int    promotion_price;
	
	public PromotionBean(){}
	
	public String getGiftName()
	{
		return giftName;
	}
	
	public int getPromotion_price()
	{
		return promotion_price;
	}
	
	public void setGiftName(String x)
	{
		giftName = x;
	}
	
	public void setPromotion_price(int x)
	{
		promotion_price = x;
	}
}