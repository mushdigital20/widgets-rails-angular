angular.module('app.Utils.Graphs',[]).factory 'bubblesService', ()->
	{
		minBulletSize: 3
		maxBulletSize: 70
		min: Infinity
		max: -Infinity
		maxSquare: @maxBulletSize * @maxBulletSize * 2 * Math.PI
		minSquare: @minBulletSize * @minBulletSize * 2 * Math.PI
		
		#calculates the min and max Radius based on the provided data
		calculateMinMax:(data)->

			@maxSquare = @maxBulletSize * @maxBulletSize * 2 * Math.PI
			@minSquare = @minBulletSize * @minBulletSize * 2 * Math.PI

			for item in data
				value = item.value
				
				if (value < @min)
					@min = value

				if (value > @max)
					@max = value

		calculateRadius:(value)->
			square = (value - @min) / (@max - @min) * (@maxSquare - @minSquare) + @minSquare

			if square < @minSquare
				square = @minSquare

			size = Math.sqrt(square / (Math.PI * 2));
			size * 9000
			
	}