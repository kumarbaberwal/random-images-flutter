class RandomImagesEntity {
    String id;
    UrlsEntity urls;
    RandomImagesEntity({
        required this.id,
        required this.urls,
    });

}

class UrlsEntity {
    String raw;
    String full;
    String regular;
    String small;
    String thumb;
    String smallS3;

    UrlsEntity({
        required this.raw,
        required this.full,
        required this.regular,
        required this.small,
        required this.thumb,
        required this.smallS3,
    });

}