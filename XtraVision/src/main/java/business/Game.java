package business;

import java.time.LocalDate;
import java.util.Objects;

public class Game extends MediaEntity{

    private String publisher;
    private Platform.GamePlatform platform;
    private Rating.GameRating gameRating;

    private static final int MAX_PUBLISHER_LENGTH = 50;

    public Game() {
    }

    public Game(int id, String name, String description, String genre, String studio, String publisher, Platform.GamePlatform platform, LocalDate releaseDate, double price, Rating.GameRating gameRating) {
        super(id, name, description, genre, studio, releaseDate, price);
        this.publisher = publisher;
        this.platform = platform;
        this.gameRating = gameRating;

    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        if (publisher == null || publisher.trim().isEmpty() || publisher.length() > MAX_PUBLISHER_LENGTH){
            throw new IllegalArgumentException("Publisher cannot be null, empty or longer than " + MAX_PUBLISHER_LENGTH + " characters.");
        }
        this.publisher = publisher;
    }

    public Platform.GamePlatform getPlatform() {
        return platform;
    }

    public void setPlatform(Platform.GamePlatform platform) {
        if (platform == null) {
            throw new IllegalArgumentException("Platform cannot be null.");
        }
        this.platform = platform;
    }

    public Rating.GameRating getGameRating() {
        return gameRating;
    }

    public void setGameRating(Rating.GameRating gameRating) {
        if (gameRating == null ) {
            throw new IllegalArgumentException("Game rating cannot be null.");
        }
        this.gameRating = gameRating;
    }

    @Override
    public String toString() {
        return "Game{" +
                super.toString() +
                "publisher='" + publisher + '\'' +
                ", platform=" + platform +
                ", gameRating=" + gameRating +
                "} ";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Game game = (Game) o;
        return Objects.equals(publisher, game.publisher) && platform == game.platform && gameRating == game.gameRating;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), publisher, platform, gameRating);
    }
}



