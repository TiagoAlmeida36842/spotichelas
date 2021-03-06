﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dto;

namespace UI.ViewModels
{
    public class SearchResultsViewModel
    {
        public IEnumerable<TrackDto> Tracks { get; set; }
        
        public string SearchTerm { get; set; }

        public int Page { get; set; }

    }
}