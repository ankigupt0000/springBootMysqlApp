package com.zetcode.model;

import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sales")
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
	private double costperitem;
	private double percentmarkup;
	private double totalsold;
	private double totalrevenue;
	private double shipcharge;
	private double shipcost;
	private double profitperitem;
	private double returns;
	private double totalincome;

    public City() {
    }

    public City(Long id, String name, double percentmarkup,double costperitem,double totalsold,double totalrevenue,double shipcharge, double shipcost, double profitperitem, double returns,double totalincome ) {
        this.id = id;
        this.name = name;
        this.percentmarkup = percentmarkup;
		this.costperitem = costperitem;
		this.totalsold = totalsold;
		this.totalrevenue = totalrevenue;
		this.shipcharge = shipcharge;
		this.shipcost = shipcost;
		this.profitperitem = profitperitem;
		this.returns = returns;
		this.totalincome = totalincome;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
	
	public double getReturns() {
        return returns;
    }

    public void setReturns(double returns) {
        this.returns = returns;
    }
	
	public double getTotalincome() {
        return totalincome;
    }

    public void setTotalincome(double totalincome) {
        this.totalincome = totalincome;
    }
	
	public double getProfitperitem() {
        return profitperitem;
    }

    public void setProfitperitem(double profitperitem) {
        this.profitperitem = profitperitem;
    }
	
    public double getPercentmarkup() {
        return percentmarkup;
    }

    public void setPercentmarkup(double percentmarkup) {
        this.percentmarkup = percentmarkup;
    }
    
	public double getShipcost() {
        return shipcost;
    }

    public void setShipcost(double shipcost) {
        this.shipcost = shipcost;
    }
	
	public double getShipcharge() {
        return shipcharge;
    }

    public void setShipcharge(double shipcharge) {
        this.shipcharge = shipcharge;
    }
	
	public double getTotalrevenue() {
        return totalrevenue;
    }

    public void setTotalrevenue(double totalrevenue) {
        this.totalrevenue = totalrevenue;
    }
	
	public double getTotalsold() {
        return totalsold;
    }

    public void setTotalsold(double totalsold) {
        this.totalsold = totalsold;
    }
	
	public double getCostperitem() {
		return costperitem;
	}
	
	public void setCostpermitem(){
		this.costperitem = costperitem;
	}

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.id);
        hash = 79 * hash + Objects.hashCode(this.name);
        hash = 79 * hash + (int)(this.percentmarkup);
		hash = 79 * hash + (int)(this.totalsold);
		hash = 79 * hash + (int)(this.costperitem);
		hash = 79 * hash + (int)(this.totalrevenue);
		hash = 79 * hash + (int)(this.shipcharge);
		hash = 79 * hash + (int)(this.shipcost);
		hash = 79 * hash + (int)(this.profitperitem);
		hash = 79 * hash + (int)(this.returns);
		hash = 79 * hash + (int)(this.totalincome);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final City other = (City) obj;
		if (this.totalincome != other.totalincome){
			return false;
		}
		if (this.returns != other.returns){
			return false;
		}
		if (this.profitperitem != other.profitperitem) {
            return false;
        }
		if (this.shipcharge != other.shipcharge) {
            return false;
        }
		if (this.shipcost != other.shipcost) {
            return false;
        }
        if (this.percentmarkup != other.percentmarkup) {
            return false;
        }
		if (this.totalrevenue != other.totalrevenue) {
			return false;
		}
		if (this.totalsold != other.totalsold) {
			return false;
		}
		if (this.costperitem != other.costperitem){
			return false;
		}
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("City{");
        sb.append("id=").append(id);
        sb.append(", name='").append(name).append('\'');
        sb.append(", percentmarkup=").append(percentmarkup);
		sb.append(", costperitem=").append(costperitem);
		sb.append(", totalsold=").append(totalsold);
		sb.append(", totalrevenue=").append(totalrevenue);
		sb.append(", shipcharge=").append(shipcharge);
		sb.append(", shipcost=").append(shipcost);
		sb.append(", profitperitem=").append(profitperitem);
		sb.append(", returns=").append(returns);
		sb.append(", totalincome=").append(totalincome);
        sb.append('}');
        return sb.toString();
    }
}
