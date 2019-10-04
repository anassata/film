package Dao;

public class Film {
    private String Userid;
    private String Title;
    private int Year;
    private String Linkfilm;
    private String Review;
    private String Creation;
    private String Genre;


    public String getUserid() {
        return Userid;
    }

    public void setUserid(String userid) {
        Userid = userid;
    }

    public void setCreation(String creation) {
        Creation = creation;
    }

    public String getCreation() {
        return Creation;
    }

    public String getReview() {
        return Review;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getLinkfilm() {
        return Linkfilm;
    }

    public String getGenre() {
        return Genre;
    }

    public void setGenre(String genre) {
        Genre = genre;
    }

    public void setLinkfilm(String linkfilm) {
        Linkfilm = linkfilm;
    }

    public void setReview(String review) {
        Review = review;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int year) {
        Year = year;
    }
}
