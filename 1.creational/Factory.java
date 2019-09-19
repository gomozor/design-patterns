//  Factory Pattern:
//      It creates pile of objects as a production machine (in other terms)
//      Only you should pass the necessary type of what you want it to create
   
import java.lang.System; 

public class Factory { 

    static SaladMakingFactory saladMaker = new SaladMakingFactory();

    public static void main(String[] args) {
        System.out.println("\n Factory pattern exercise begins!!"); 
        System.out.println("\n ... \n ... \n ...  \n ...  \n ... ");
        saladMaker.mixIt(saladMaker.makeItRightNow(SaladType.VegetableSalad));
    }

    interface Ingredient {
        void smells();
        void tastes();
    }
     
    interface Salad {
        Ingredient[] makeItRightNow(Factory.SaladType type);
        void mixIt(Factory.Ingredient[] choppedInBowl);
    }
 
    enum SaladType {
        FruitSalad,
        VegetableSalad,
        OtherType,
        None
    }
}

class SaladMakingFactory implements Factory.Salad {   
    @Override
    public Factory.Ingredient[] makeItRightNow(Factory.SaladType type) { 
        switch(type) {
            case FruitSalad:  
                return new Factory.Ingredient[] {
                    new Fruit("Banana"),
                    new Fruit("Strawberry"),
                    new Fruit("Kiwi"),
                    new Fruit("Chocolate Sauce"),
                }; 
            case VegetableSalad: 
                return new Factory.Ingredient[] {
                    new Vegetable("Tomato"),
                    new Vegetable("Sweet Pepper"),
                    new AnySubstance("Salt"),
                    new AnySubstance("Dib Roman"),
                    new AnySubstance("Sunflower Seed Oil"),
                };
            case OtherType: 
            case None:  
                return null;
        }
        return null;
    }

    @Override
    public void mixIt(Factory.Ingredient[] choppedInBowl) {
        if (choppedInBowl == null) { 
            System.out.print("\n Sorry! \n Nothing exists in the bowl!");
        } else {
            for (Factory.Ingredient i : choppedInBowl) {
                i.smells();
                i.tastes();
            }
            System.out.println("\n ... \n ... \n ...  \n ...  \n ... ");
            System.out.print("\n Done!");
            System.out.print("\n Ready to enjoy! \n \n");
        }
    }
}

class Vegetable implements Factory.Ingredient {
  
    String name; 
    Vegetable(String name) {
        this.name = name;
    }

    @Override
    public void smells() {
        System.out.printf("\n Any %s has a smell", this.name);
    }

    @Override
    public void tastes() {
        System.out.printf("\n Any %s has a taste", this.name);
    }
}

class Fruit implements Factory.Ingredient {
  
    String name; 
    Fruit(String name) {
        this.name = name;
    }
  
    @Override
    public void smells() {
        System.out.printf("\n I dont take the smell on %s generally", this.name);
    }

    @Override
    public void tastes() {
        System.out.printf("\n Most fruits tastes good, have you tried %s?", this.name);
    }
}

class AnySubstance implements Factory.Ingredient {
  
    String name; 
    AnySubstance(String name) {
        this.name = name;
    }
  
    @Override
    public void smells() {
        System.out.printf("\n %s may or may not smell!", this.name);
    }

    @Override
    public void tastes() {
        System.out.printf("\n %s donest have to have a taste", this.name);
    }
} 