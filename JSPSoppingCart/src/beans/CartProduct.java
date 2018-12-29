package beans;

public class CartProduct {
	
		private String pId,pName;
		private float pPrice;
		private int pQty;
		private int reqPQty;
		
		public CartProduct() {
			super();
		}

		public CartProduct(String pId, String pName, float pPrice, int pQty, int reqPQty) {
			super();
			this.pId = pId;
			this.pName = pName;
			this.pPrice = pPrice;
			this.pQty = pQty;
			this.reqPQty = reqPQty;
		}
		
		
		
		public int getReqPQty() {
			return reqPQty;
		}
		public void setReqPQty(int reqPQty) {
			this.reqPQty = reqPQty;
		}

		public String getpId() {
			return pId;
		}
		public void setpId(String pId) {
			this.pId = pId;
		}
		public String getpName() {
			return pName;
		}
		public void setpName(String pName) {
			this.pName = pName;
		}
		public float getpPrice() {
			return pPrice;
		}
		public void setpPrice(float pPrice) {
			this.pPrice = pPrice;
		}
		public int getpQty() {
			return pQty;
		}
		public void setpQty(int pQty) {
			this.pQty = pQty;
		}

}
