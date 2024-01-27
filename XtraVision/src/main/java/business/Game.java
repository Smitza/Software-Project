    package business;

    import java.time.LocalDate;
    import java.util.Objects;

    public class Game extends MediaEntity {


        private static final int MAX_DEVELOPER_LENGTH = 50;
        private static final int MAX_PUBLISHER_LENGTH = 50;

        private int id;
        private String name;
        private String description;
        private String genre;
        private String developer;
        private String publisher;
        private Platform.GamePlatform platform; // 3 possible platforms the user can pick. Pc , Xbox or Playstation
        private LocalDate releaseDate;
        private double price;
        private Rating.GameRating gameRating;


        //maybe  regular expressions too

        public Game() {
        }

        public Game(int id, String name, String description, String genre, String developer, String publisher, Platform.GamePlatform platform, LocalDate releaseDate, double price, Rating.GameRating gameRating) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.genre = genre;
            this.developer = developer;
            this.publisher = publisher;
            this.platform = platform;
            this.releaseDate = releaseDate;
            this.price = price;
            this.gameRating = gameRating;
        }

        public int getId() {
            return id;

        }

        public void setId(int id) {
            if (id <= 0) {
                throw new IllegalArgumentException("ID must be positive");
            }
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            if (name == null || name.trim().isEmpty() || name.length() > MAX_NAME_LENGTH) {
                throw new IllegalArgumentException("Name cannot be null, empty, or longer than 100 characters");
            }
            this.name = name;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            if (description == null || description.trim().isEmpty() || description.length() > MAX_DESCRIPTION_LENGTH) {
                throw new IllegalArgumentException("Description cannot be null, empty or longer than 500 characters");
            }
            this.description = description;
        }



        public String getGenre() {
            return genre;
        }

    //might do enum for genre

        public void setGenre(String genre) {
            if (genre == null || genre.trim().isEmpty()) {
                throw new IllegalArgumentException("Genre cannot be null or empty");
            }
            this.genre = genre;
        }

        public String getDeveloper() {
            return developer;
        }

        public void setDeveloper(String developer) {
            if (developer == null || developer.trim().isEmpty() || developer.length() > MAX_DEVELOPER_LENGTH) {
                throw new IllegalArgumentException("Developer cannot be null, empty or longer than 50 characters");
            }
            this.developer = developer;
        }

        public String getPublisher() {
            return publisher;
        }

        public void setPublisher(String publisher) {
            if (publisher == null || publisher.trim().isEmpty() || publisher.length() > MAX_PUBLISHER_LENGTH){
                throw new IllegalArgumentException("Publisher cannot be null, empty or longer than 50 characters");
            }
            this.publisher = publisher;
        }

        public Platform.GamePlatform getPlatform() {
            return platform;
        }

        public void setPlatform(Platform.GamePlatform platform) {
            if (platform == null) {
                throw new IllegalArgumentException("Platform cannot be null");
            }
            this.platform = platform;
        }

        public LocalDate getReleaseDate() {
            return releaseDate;
        }

        public void setReleaseDate(LocalDate releaseDate) {
            if (releaseDate == null || releaseDate.isAfter(LocalDate.now())) {
                throw new IllegalArgumentException("Release date cannot be null or in the future");
            }
            this.releaseDate = releaseDate;
        }

        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            if (price < 0 || price > MAX_PRICE) {
                throw new IllegalArgumentException("Price cannot be negative and not exceed €100");
            }
            this.price = price;
        }

        public Rating.GameRating getGameRating() {
            return gameRating;
        }

        public void setGameRating(Rating.GameRating gameRating) {
            if (gameRating == null ) {
                throw new IllegalArgumentException("Game rating cannot be null");
            }
            this.gameRating = gameRating;
        }

        @Override
        public String toString() {
            return "Game{" +
                    "id=" + id +
                    ", name='" + name + '\'' +
                    ", description='" + description + '\'' +
                    ", genre='" + genre + '\'' +
                    ", developer='" + developer + '\'' +
                    ", publisher='" + publisher + '\'' +
                    ", platform='" + platform + '\'' +
                    ", releaseDate=" + releaseDate +
                    ", price=" + price +
                    ", gameRating=" + gameRating +
                    '}';
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Game game = (Game) o;
            return id == game.id;
        }

        @Override
        public int hashCode() {
            return Objects.hash(id);
        }
    }