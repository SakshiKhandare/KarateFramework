package helpers;

import com.github.javafaker.Faker;

import net.minidev.json.JSONObject;

public class DataGenerator {
 
    public static String getRandomName(){
        Faker faker = new Faker();
        String name = faker.name().firstName().toLowerCase();
        return name;
    }

    public static String getRandomJob() {
        Faker faker = new Faker();
        String job = faker.job().title().toLowerCase();
        return job;
    }

    public String getRandomName2(){
        Faker faker = new Faker();
        String name = faker.name().firstName().toLowerCase();
        return name;
    }

    public static JSONObject getRandomJson() {
        Faker faker = new Faker();
        String name = faker.name().firstName().toLowerCase();
        String job = faker.job().title().toLowerCase();
        JSONObject json = new JSONObject();
        json.put("name",name);
        json.put("job",job);
        return json;
    }
}



