require 'ostruct'

module Awestruct
  module Extensions
    class PostsArchiver

      def initialize(input_path, var_posts=:posts, assign_to=:archive, opts={})
        @input_path = input_path
        @var_posts = var_posts
        @assign_to = assign_to
        @output_prefix = opts[:output_prefix] || File.dirname( @input_path )
      end

      def execute(site)
        page = site.engine.find_and_load_site_page( @input_path )
        page.output_path = File.join( @output_prefix, File.basename( @input_path ) + ".html" )

        archive = {}
        posts = site.send("#{@var_posts}")
        posts.each do |post|          
          year = post.date.strftime('%Y')
          month = post.date.strftime('%B')          
          yearly_archive = archive[year]  || {}
          monthly_archive = yearly_archive[month] || []
          monthly_archive << post
          yearly_archive[month] =monthly_archive
          archive[year] = yearly_archive
        end

        site.send( "#{@assign_to}=", archive )
        site.pages << page
      end
    end
  end
end