ALTER DATABASE dsanderson3 SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS articletag;


CREATE TABLE author ()
		authorId BINARY(16) NOT NULL,
		authorAvatarUrl VARCHAR(128) NOT NULL,
		authorActivationToken VARCHAR(32) NOT NULL,
		authorEmail VARCHAR(64) NOT NULL,
		authorHash CHAR(98) NOT NULL,
		authorUsername VARCHAR(32) NOT NULL,

PRIMARY KEY (authorId)
);

CREATE TABLE tag (
		tagId BINARY(16) NOT NULL,
		tagName VARCHAR(16) NOT NULL,

		UNIQUE(tagId)

		PRIMARY KEY (tagId, tagName)

);

CREATE TABLE article (
		articleId BINARY(16) NOT NULL,
		articleAuthorId BINARY(16) NOT NULL,
		articleContent VARCHAR(22000) NOT NULL,
		articleDate DATETIME(6) NOT NULL,
		articleImage VARCHAR(128) NOT NULL,

		INDEX(articleAuthorId),

		FOREIGN KEY(articleAuthorId) REFERENCES author(authorId),

		PRIMARY KEY (articleId)
);


CREATE TABLE articleTag (
		articleTagArticleId BINARY(16) NOT NULL,
		articleTagTagId BINARY(16) NOT NULL,

		INDEX(articleTagTagId),

		FOREIGN KEY(articleTagTagId) REFERENCES tag(tagId),
		FOREIGN KEY(articleTagTagId) REFERENCES article(articleId),

		PRIMARY KEY(articleTagArticleId, articleTagTagId)
);

