.PHONY: doc

doc:
	python3 script/generate-readme.py
	python3 script/validate-readme-links.py
