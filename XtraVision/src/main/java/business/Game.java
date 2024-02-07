package business;

import java.time.LocalDate;
import java.util.Objects;

public class Game extends Product{

    private String publisher;
    private Platform.GamePlatform platform;
    private Rating.GameRating gameRating;

    private static final int MAX_PUBLISHER_LENGTH = 50;

    public Game() {
    }
    /**
     * Constructs a new Game instance with specified details including product attributes and game-specific attributes.
     *
     * @param productid    the unique identifier for the product
     * @param name         the name of the game
     * @param description  a brief description of the game
     * @param genre        the genre of the game
     * @param studio       the studio that developed the game
     * @param publisher    the publisher of the game
     * @param platform     the platform on which the game is available
     * @param releaseDate  the release date of the game
     * @param price        the price of the game
     * @param quantity     the available quantity of the game
     * @param gameRating   the ESRB rating of the game
     */
    public Game(int productid, String name, String description, String genre, String studio, String publisher, Platform.GamePlatform platform, LocalDate releaseDate, double price, int quantity, Rating.GameRating gameRating) {
        super(productid, name, description, genre, studio, releaseDate, price, quantity);
        this.publisher = publisher;
        this.platform = platform;
        this.gameRating = gameRating;

    }
    /**
     * Returns the publisher of the game.
     *
     * @return the publisher name
     */
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
    public String toString() { // may need to change this:/
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



