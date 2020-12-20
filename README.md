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

See a sample rails app on `/sample`.
