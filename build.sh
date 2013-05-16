hem build
s3cmd -c ~/.s3cfg-personal put --acl-public public/index.html public/application* s3://akapadia/border-dispatches/
rm public/application*