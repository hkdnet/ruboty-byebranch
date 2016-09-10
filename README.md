# Ruboty::Byebranch

A Ruboty Handler + Actions to Delete merged branches.

[Ruboty](https://github.com/r7kamura/ruboty) is Chat bot framework. Ruby + Bot = Ruboty

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-byebranch'
```

And then execute:

    $ bundle

## Commands

|Command|Pattern|Description|
|:--|:--|:--|
|[byebranch](#byebranch)|byebranch (?&lt;user&gt;.+?) (?&lt;repository&gt;.+?) (?&lt;exclude_branches&gt;.+?)\z/|Delete merged branches|

## Usage
### byebranch
* Delete merged branch

~~~
@ruboty byebranch tbpgr eto master,release
~~~

## ENV

|Name|Description|
|:--|:--|
|GITHUB_USER|GitHub USER|
|GITHUB_TOKEN|GitHub API Token|

## Dependency

Nothing

## Contributing

1. Fork it ( https://github.com/tbpgr/ruboty-byebranch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
