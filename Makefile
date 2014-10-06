tmp=_git_distcheck

all:
	cargo build --release --features "2df32"
	cargo build --release --features "3df32"
	cargo build --release --features "4df32"
	cargo build --release --features "2df64"
	cargo build --release --features "3df64"
	cargo build --release --features "4df64"
	cd build/ncollide2df32; cargo build --release
	cd build/ncollide2df64; cargo build --release
	cd build/ncollide3df32; cargo build --release
	cd build/ncollide3df64; cargo build --release
	cd build/ncollide4df32; cargo build --release
	cd build/ncollide4df64; cargo build --release

test:
	cargo test --features "3df32"
	cargo test --features "3df64"
	cargo test --features "4df32"
	cargo test --features "4df64"
	cargo test --features "2df32"
	cargo test --features "2df64"

distcheck:
	rm -rf $(tmp)
	git clone . $(tmp)
	make -C $(tmp)
	rm -rf $(tmp)

doc:
	cargo doc

clean:
	cargo clean
