/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Admin
 */
public class GoogleUtils {

    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = org.apache.http.client.fluent.Request.Post(APIConstants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", APIConstants.GOOGLE_CLIENT_ID)
                        .add("client_secret", APIConstants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", APIConstants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", APIConstants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = APIConstants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        System.out.println(response);
        GooglePojo googlePojo = new Gson().fromJson(response, GooglePojo.class);
        System.out.println(googlePojo);
        String linkToGetPhoneNGender = APIConstants.GOOGLE_LINK_GET_USER_PHONE_GENDER + googlePojo.getId() + "?access_token=" + accessToken + "&personFields=phoneNumbers,genders";
        String phoneNGenderResponse = Request.Get(linkToGetPhoneNGender).execute().returnContent().asString();
        System.out.println(phoneNGenderResponse);
        PhoneNGender phoneNGender = new Gson().fromJson(phoneNGenderResponse, PhoneNGender.class);
        try {
            googlePojo.setGender(phoneNGender.getGenders()[0].getValue());
            googlePojo.setPhoneNumber(phoneNGender.getPhoneNumbers()[0].getValue());
        } catch (NullPointerException e) {
            System.out.println(e);
        }
        System.out.println(phoneNGender);
        return googlePojo;
    }
}
//118091383633951252711?personFields=phoneNumbers,genders

//ya29.a0AfB_byDpy2oo_seuNbpwavqiGFP4-8yJYi0ogyNn6UprPaTB3bktBu_h9sMJDPGjXfQ39PuHea-g0R_OltGzznvKhsY4RbwGlB7P-5qaxHsMVLABniq2bZ1niK426GqAnYOnyRfdLrXS_QcaEwnXIHTjzZ5IfvkF3NajaCgYKARESARISFQHGX2MiqO1RhevKrmkLMV5oziSz_g0171
