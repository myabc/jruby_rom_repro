Issue with ROM and JRuby, auto_registration of relations fail with an empty klass_name in `lib/ruby/gems/shared/gems/rom-2.0.2/lib/rom/setup/auto_registration.rb`.

To repro:
```
$ bin/console
> LibraryApiClient.setup do |config|
   config.api_url = 'https://example.com'
   config.token = 'SOME TOKEN'
 end
```
