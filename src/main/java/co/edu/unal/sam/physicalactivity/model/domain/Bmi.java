package co.edu.unal.sam.physicalactivity.model.domain;

import javax.persistence.Column;
import javax.persistence.ForeignKey;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import co.edu.unal.sam.aspect.model.domain.Entity;
import co.edu.unal.sam.aspect.model.domain.User;
import co.edu.unal.sam.physicalactivity.model.enumerator.BmiCategoryEnum;
import co.edu.unal.sam.physicalactivity.model.enumerator.TypeRiskEnum;

@javax.persistence.Entity
@javax.persistence.Table(name = "bmi")
public class Bmi extends Entity {

    @Column(name = "bmi")
    private Float bmi;

    @Column(name = "category_id", nullable = true)
    @Type(type = "co.edu.unal.sam.physicalactivity.model.usertype.BmiCategoryType")
    private BmiCategoryEnum category;

    @Column(name = "height")
    private Float height;

    @Column(name = "risk_id")
    @Type(type = "co.edu.unal.sam.physicalactivity.model.usertype.TypeRiskType")
    private TypeRiskEnum risk;

    @ManyToOne()
    @JoinColumn(name = "user_id", foreignKey = @ForeignKey(name = "fk_bmi_user"))
    private User user;

    @Column(name = "weight")
    private Float weight;

    /**
     * @return the bmi
     */
    public Float getBmi() {
        return this.bmi;
    }

    /**
     * @return the category
     */
    public BmiCategoryEnum getCategory() {
        return this.category;
    }

    /**
     * @return the height
     */
    public Float getHeight() {
        return this.height;
    }

    /**
     * @return the risk
     */
    public TypeRiskEnum getRisk() {
        return this.risk;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return this.user;
    }

    /**
     * @return the weight
     */
    public Float getWeight() {
        return this.weight;
    }

    /**
     * @param bmi the bmi to set
     */
    public void setBmi(Float bmi) {
        this.bmi = bmi;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(BmiCategoryEnum category) {
        this.category = category;
    }

    /**
     * @param height the height to set
     */
    public void setHeight(Float height) {
        this.height = height;
    }

    /**
     * @param risk the risk to set
     */
    public void setRisk(TypeRiskEnum risk) {
        this.risk = risk;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @param weight the weight to set
     */
    public void setWeight(Float weight) {
        this.weight = weight;
    }

}
