import java.lang.System; 

public class Factory { 
    public static void main(String[] args) {
        System.out.println("Factory pattern exercise begins!!");



    }

    interface Ingredient {
        void smells();
        void tastes();
    }
} 

class Vegetable implements Factory.Ingredient {
  
    String name;

    Vegetable(String name) {
        this.name = name;
    }

    @Override
    public void smells() {
        System.out.println("Any vegetable has a smells");
    }

    @Override
    public void tastes() {
        System.out.println("Any vegetable has a taste");
    }
}

class Fruit implements Factory.Ingredient {
  
    String name; 
    Fruit(String name) {
        this.name = name;
    }
  
    @Override
    public void smells() {
        System.out.println("I dont take the smell on fruit generally");
    }

    @Override
    public void tastes() {
        System.out.println("Most fruits tastes sweet, there are exceptions either");
    }
}