function v = difpp(p1, p2)
    v = [setdiff(p1,p2)' setdiff(p2,p1)'];
end