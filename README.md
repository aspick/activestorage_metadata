# activestorage_metadata

Set custom metadata to a S3 object of ActiveStorage blob 


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activestorage_metadata'
```

And then execute:

    $ bundle


## Usage

Set metadata with `attach` method (see a sample rails app on `/sample`).

```ruby
@article = Article.create(create_params.slice(:title, :content))
attachable = create_params[:image]
@article.image.attach(
  io: attachable.tempfile.open,
  filename: attachable.original_filename,
  content_type: attachable.content_type,
  metadata: {
    custom_metadata: {
      article_id: @article.id.to_s
    }
  }
)
```

```sh
$ aws s3api head-object --key $key --bucket $bucket
{
    "AcceptRanges": "bytes",
    "LastModified": "Sun, 20 Dec 2020 08:54:33 GMT",
    "ContentLength": 214448,
    "ETag": "\"ba5da3176b2eea69226725613b288704\"",
    "ContentType": "image/gif",
    "Metadata": {
        "article_id": "25"
    }
}
```
