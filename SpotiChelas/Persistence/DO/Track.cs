﻿using System;

namespace Persistence.DO
{
    public class Track
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Artist { get; set; }
        public TimeSpan Duration { get; set; }
    }
}