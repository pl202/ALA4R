context("Test that variables are renamed correctly")

ala_config(caching="off")

test_that("acronyms remain uppercase", {
    expect_equal(rename_variables("IMCRA","assertions"),"iMCRA")
    expect_equal(rename_variables("IMCRA","occurrence"),"IMCRA")
})

test_that("underscores are renamed to camelCase", {
    expect_equal(rename_variables("this_that","occurrence"),"thisThat")
})

test_that("particular variables are renamed for occurrence data", {
    temp=c("scientificName","matchedScientificName","recordID","xVersion","MatchTaxonConceptGUID","vernacularName","taxonRank","matchedsomething","processedsomething","parsedsomething")
    temp2=rename_variables(temp,"occurrence")
    expect_true(!any(temp==temp2))
})

          