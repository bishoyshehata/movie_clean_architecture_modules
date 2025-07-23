
import 'package:flutter/material.dart';
import 'package:movies/domain/model/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  const MovieCard(this.movie , {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                  child: Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.black87,
                    radius: 16,
                    child: Text(
                      movie.voteAverage.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 11 ,fontWeight: FontWeight.bold),
                    ),
                  )
                ),
                Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ))
              ],
            ),
            Text(
              movie.title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 11 ,fontWeight: FontWeight.bold),
            ),
          SizedBox(height: 4,),
            Text(
              movie.releaseDate,
              style: TextStyle(color: Colors.black87, fontSize: 11 ,fontWeight: FontWeight.bold),
            ),
              ],
            )
    );
  }
}
