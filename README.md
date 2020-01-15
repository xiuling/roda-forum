# forum
This forum is built by roda, sequel, rack, slim, etc.

favicon: https://favicon.io
sequel -m utils/migrations sqlite://forum.db
rackup -o0.0.0.0 -p9292
